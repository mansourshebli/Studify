import SwiftUI

struct ToDoView: View {
    @ObservedObject var todoManager = TodoManager()

    @State private var searchText = ""
    @State private var showSheet = false
    @State private var showConfirmAlert = false

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)

                ProgressBar(todoManager: todoManager)

                List($todoManager.todos, editActions: [.all]) { $todo in
                    if searchText.isEmpty || todo.title.localizedCaseInsensitiveContains(searchText) {
                        NavigationLink(destination: TodoDetailView(todo: $todo)) {
                            HStack {
                                Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle").onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                                VStack(alignment: .leading) {
                                    Text(todo.title).strikethrough(todo.isCompleted)
                                    if !todo.subtitle.isEmpty {
                                        Text(todo.subtitle).font(.caption).foregroundColor(.gray)
                                    }
                                }
                                .padding(.vertical, 8)
                            }
                        }
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        showConfirmAlert = true
                    } label: {
                        Image(systemName: "clipboard.fill")
                    }
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                NewTodoView(sourceArray: $todoManager.todos).presentationDetents([.medium])
            }.alert("Load sample data? WARNING: All existing todos will be deleted.", isPresented: $showConfirmAlert) {
                Button("Replace", role: .destructive) {
                    todoManager.loadSampleData()
                }
            }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
