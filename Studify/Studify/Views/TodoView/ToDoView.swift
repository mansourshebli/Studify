import SwiftUI

struct ToDoView: View {
    @ObservedObject var todoManager = TodoManager()

    @State private var searchText = ""
    @State private var showSheet = false

    var body: some View {
        NavigationView {
            List {
                Section(header: SearchBar(searchText: $searchText)) {
                    ProgressView(value: todoManager.completionPercentageTodo)
                }

                ForEach($todoManager.todos) { $todo in
                    if searchText.isEmpty || todo.title.localizedCaseInsensitiveContains(searchText) {
                        NavigationLink(destination: TodoDetailView(todo: $todo)) {
                            HStack {
                                if todo.isCompleted == true{
                                    Image(systemName: "checkmark.circle.fill").foregroundColor(.green).onTapGesture {
                                        todo.isCompleted.toggle()
                                    }
                                } else{
                                    Image(systemName: "circle").foregroundColor(.black).onTapGesture {
                                        todo.isCompleted.toggle()
                                    }
                                }

                                VStack(alignment: .leading) {
                                    Text(todo.title)
                                    if !todo.subtitle.isEmpty {
                                        Text("\(todo.subtitle) - \(todo.todoDueDate, formatter: dateFormatter)").font(.caption).foregroundColor(.gray)
                                    }
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteTodo)
                .onMove(perform: moveTodos)
            }
            .listStyle(PlainListStyle())
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                NewTodoView { newTodo in
                    todoManager.todos.append(newTodo)
                }
                .presentationDetents([.medium])
            }
        }
    }

    func deleteTodo(at offsets: IndexSet) {
        todoManager.todos.remove(atOffsets: offsets)
    }

    func moveTodos(from source: IndexSet, to destination: Int) {
        todoManager.todos.move(fromOffsets: source, toOffset: destination)
    }

    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter
    }()
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
