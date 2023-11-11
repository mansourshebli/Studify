import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: Todo

    var body: some View {
        Form {
            TextField("Title", text: $todo.title)
            TextField("Subtitle", text: $todo.subtitle)
                .foregroundColor(.gray)
            DatePicker("Due Date", selection: $todo.todoDueDate)

            Text("Todo Status: \(todo.isCompleted ? "Completed ✅" : "Not Yet ❌")")
                .foregroundColor(todo.isCompleted ? .green : .red)
            
            Toggle("Completed?", isOn: $todo.isCompleted)
        }
        .navigationTitle("Todo Detail")
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            TodoDetailView(todo: .constant(Todo(title: "Feed the cat")))
        }
    }
}
