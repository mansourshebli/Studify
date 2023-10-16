import SwiftUI

struct TodoDetailView: View {
    @Binding var todo: Todo
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $todo.title)
                TextField("Subtitle", text: $todo.subtitle)
                Toggle("Is completed?", isOn: $todo.isCompleted)
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
                    subtitle: "123"
                ))
            )
        }
    }
}
