import Foundation

struct Todo: Identifiable {
    var id = UUID()
    var Title: String
    var subtitle: String
    var isCompleted = false
}

