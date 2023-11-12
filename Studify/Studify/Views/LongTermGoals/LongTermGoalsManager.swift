//
//  LongTermGoalsManager.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 05/11/2023.
//

import Foundation
import SwiftUI

class LongTermGoalsManager: ObservableObject {
    @Published var goals: [LongTermGoal] = [] {
        didSet {
            save()
        }
    }

    var completionPercentage: Double {
        let completedCount = goals.filter { $0.progress == 1.0 }.count
        let totalCount = goals.count
        return totalCount > 0 ? Double(completedCount) / Double(totalCount) : 0.0
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
