//Here is the struct I used to declare todos.
import Foundation
import SwiftUI

struct Todo: Identifiable {
    var id = UUID()
    var title: String
    var subtitle: String
    var isCompleted = false
    var priority: TodoPriority
    var priorityColor: Color
}

enum TodoPriority: String, CaseIterable { //CaseIterable will generate an array property of al cases in an enum.
    
    //Here are the three categories where the todos will be classified into.
    case red = "Urgent"
    case orange = "Important"
    case yellow = "Minimal"
     
}
