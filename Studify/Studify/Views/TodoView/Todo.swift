import Foundation
import SwiftUI

struct Todo: Identifiable, Codable {
    
    var id = UUID()
    
    var title: String
    var subtitle = ""
    var todoDueDate = Date()
    var isCompleted = false
}
