import Foundation

struct Subtask: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}

struct LongTermGoal: Identifiable, Codable {
    var id = UUID()
    var title: String
    var subtasks: [Subtask]
    
    
    var progress: Double {
        let completedSubtasks = subtasks.filter { $0.isCompleted }
        return Double(completedSubtasks.count) / Double(subtasks.count)
    }
}
