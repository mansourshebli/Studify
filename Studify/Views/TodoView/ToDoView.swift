import SwiftUI

struct ToDoView: View {
    @State private var todos = [
        Todo(Title: "Add more todos!!", subtitle: "Add as much todos as you want!!")
        
    ]
    @State private var showSheet = false
    var body: some View {
        NavigationStack {
            List($todos, editActions: [.all]) { $todo in
                NavigationLink{
                    TodoDetailView(todo: $todo)
                } label: {
                    HStack {
                        Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle").onTapGesture {
                            todo.isCompleted.toggle()
                        }
                        VStack (alignment: .leading, spacing: 2){
                            Text(todo.Title).strikethrough(todo.isCompleted)
                            if !todo.subtitle.isEmpty{
                                Text(todo.subtitle).font(.caption).foregroundColor(.gray).strikethrough(todo.isCompleted)
                            }
                        }
                    }
                }
            }.navigationTitle("Todos")
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        EditButton()}
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button{
                            showSheet = true
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                    
                }
                .sheet(isPresented: $showSheet){
                    NewTodoView(sourceArray: $todos).presentationDetents([.medium])
                }
        }
    }
    
    
    
    struct ToDoView_Previews: PreviewProvider {
        static var previews: some View {
            ToDoView()
        }
    }
}

