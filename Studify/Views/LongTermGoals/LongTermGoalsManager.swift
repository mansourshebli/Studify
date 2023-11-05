//
//  LongTermGoalsManager.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 05/11/2023.
//

import Foundation
import SwiftUI

class LongTermGoalManager: ObservableObject {
    @Published var longTermGoals: [LongTermGoal] = [] {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    

    
    func getArchiveURL() -> URL {
        let plistName = "longTermGoals.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedGoals = try? propertyListEncoder.encode(longTermGoals)
        try? encodedGoals?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedData = try? Data(contentsOf: archiveURL),
            let goalsDecoded = try? propertyListDecoder.decode([LongTermGoal].self, from: retrievedData) {
            longTermGoals = goalsDecoded
        }
    }
}
