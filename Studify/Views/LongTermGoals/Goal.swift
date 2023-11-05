//
//  Goal.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 05/11/2023.
//

import Foundation

struct Subtask: Identifiable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct LongTermGoal: Identifiable {
    var id = UUID()
    var title: String
    var subtasks: [Subtask]
    
    var progress: Double {
        let completedSubtasks = subtasks.filter { $0.isCompleted }
        return Double(completedSubtasks.count) / Double(subtasks.count)
    }
}
