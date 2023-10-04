//This view is shown when the user clicks on a todo to view and edit the details.
import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: Todo
    @Binding var selectedPriorityFilter: TodoPriority?
    
    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            TextField("Subtitle", text: $todo.subtitle)
            Toggle("Is completed?", isOn: $todo.isCompleted)
            
            if let selectedPriority = selectedPriorityFilter {
                Text("Priority: \(selectedPriority.rawValue)")
            } else {
                Text("Priority: \(todo.priority.rawValue)")
                    .foregroundColor(todo.priorityColor)
            }
        }
        .navigationTitle("Todo Detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoDetailView(
                todo: .constant(Todo(
                    title: "Feed the cat",
                    subtitle: "123",
                    priority: .yellow, // Correct the order
                    priorityColor: .yellow // Correct the order
                )),
                selectedPriorityFilter: .constant(.yellow)
            )
        }
    }
}
