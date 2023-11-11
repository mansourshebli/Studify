import Foundation
import SwiftUI

struct Todo: Identifiable, Codable {
    
    // A computed property to generate a unique identifier for each Todo item
    var id = UUID()
    
    // Properties to store the title, subtitle, color, due date, and completion status of a Todo item
    var title: String
    var subtitle = ""
    var todoDueDate = Date()
    var isCompleted = false
}

