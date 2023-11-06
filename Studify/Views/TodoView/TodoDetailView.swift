import SwiftUI

struct TodoDetailView: View {
    
    // Binding to a Todo item passed from ContentView
    @Binding var todo: Todo
    
    var body: some View {
        // Create a Form view for displaying and editing the Todo item
        Form {
            // Text field for editing the title of the Todo item
            TextField("Title", text: $todo.title)
            
            // Text field for editing the subtitle of the Todo item
            TextField("Subtitle", text: $todo.subtitle)
                .foregroundColor(.gray) // Set text color to gray
            
            // DatePicker for selecting the due date of the Todo item
            DatePicker("Due Date", selection: $todo.todoDueDate)
            
            // Tracking the progress of the todo!!
            Text("Todo Status: \(todo.isCompleted ? "Completed ✅" : "Not Yet ❌")" )
                .foregroundColor(todo.isCompleted ? .green : .red)
            
            // Toggle switch to change the completion status of the Todo item
            Toggle("Completed?", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo Detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            // Create a preview of TodoDetailView with a sample Todo item
            TodoDetailView(todo: .constant(Todo(title: "Feed the cat")))
        }
    }
}
