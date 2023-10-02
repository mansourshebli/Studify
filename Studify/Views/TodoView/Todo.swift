//Here is the struct I used to declare todos.
import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var Title: String
    var subtitle: String
    var isCompleted = false
}

