import SwiftUI

struct NewTodoView: View {
    @State private var title = ""
    @State private var subtitle = ""
    @State private var dueDate = Date()

    var onSave: (Todo) -> Void
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
                DatePicker("Due Date", selection: $dueDate)
            }
            Section {
                Button("Save") {
                    let newTodo = Todo(
                        title: title,
                        subtitle: subtitle,
                        todoDueDate: dueDate,
                        isCompleted: false
                    )
                    onSave(newTodo)
                    dismiss()
                }
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        let onSave: (Todo) -> Void = { todo in
            // Implement how to handle the new todo in your app
            print("Saved todo: \(todo)")
        }
        return NewTodoView(onSave: onSave)
    }
}
