//Here is the struct I used to declare todos.
import Foundation
import SwiftUI

struct Todo: Identifiable, Codable {
    var id = UUID()
    var title: String
    var subtitle: String
    var isCompleted = false

}
