//
//  LongTermGoalsManager.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 04/11/2023.
//

import Foundation

class LongTermGoalsManager: ObservableObject {
    @Published var longTermGoals: [LongTermGoal] = [] {
        didSet {
            save()
        }
    }
    
    init() {
        load()
    }
    
    func loadSampleData() {
        longTermGoals = [
            LongTermGoal(title: "Complete Project A", subtasks: [
                Subtask(title: "Research"),
                Subtask(title: "Design"),
                Subtask(title: "Development"),
                Subtask(title: "Testing"),
                Subtask(title: "Documentation"),
            ]),
            // Add more long-term goals here
        ]
    }
    
    func getArchiveURL() -> URL {
        let plistName = "longTermGoals.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        let propertyListEncoder = PropertyListEncoder()
        let encodedLongTermGoals = try? propertyListEncoder.encode(longTermGoals)
        try? encodedLongTermGoals?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
        
        if let retrievedGoalsData = try? Data(contentsOf: archiveURL),
           let goalsDecoded = try? propertyListDecoder.decode([LongTermGoal].self, from: retrievedGoalsData) {
            longTermGoals = goalsDecoded
        }
    }
}
