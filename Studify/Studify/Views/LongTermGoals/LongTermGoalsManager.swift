import Foundation
import SwiftUI

class LongTermGoalsManager: ObservableObject {
    @Published var goals: [LongTermGoal] = [] {
        didSet {
            save()
        }
    }
        
    init() {
        load()
    }
    
    func getArchiveURL() -> URL {
        let plistName = "goals.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedLongTermGoals = try? propertyListEncoder.encode(goals)
        try? encodedLongTermGoals?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedLongTermGoalData = try? Data(contentsOf: archiveURL),
            let goalsDecoded = try? propertyListDecoder.decode([LongTermGoal].self, from: retrievedLongTermGoalData) {
            goals = goalsDecoded
        }
    }
}
