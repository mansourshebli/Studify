//Here is the main view for the todo feature.
import SwiftUI

struct ToDoView: View {
    @StateObject var todoManager = TodoManager()
    @State private var searchText = ""
    @State private var showSheet = false
    
    @State private var selectedPriorityFilter: TodoPriority? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                SearchBar(searchText: $searchText)
                
                Picker("Filter by Priority", selection: $selectedPriorityFilter) {
                    Text("All").tag(nil as TodoPriority?)
                    ForEach(TodoPriority.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority as TodoPriority?)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                
                List($todoManager.todos, editActions: [.all]) { $todo in
                    if (searchText.isEmpty || todo.title.localizedCaseInsensitiveContains(searchText)) &&
                       (selectedPriorityFilter == nil || todo.priority == selectedPriorityFilter) {
                        NavigationLink(destination: TodoDetailView(todo: $todo, selectedPriorityFilter: $selectedPriorityFilter)) {
                            HStack {
                                RoundedRectangle(cornerRadius: 6)
                                    .fill(todo.priorityColor)
                                    .frame(width: 10, height: 10)
                                VStack(alignment: .leading, spacing: 2) {
                                    Text(todo.title).strikethrough(todo.isCompleted)
                                    if !todo.subtitle.isEmpty {
                                        Text(todo.subtitle).font(.caption).foregroundColor(.gray)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Todos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                NewTodoView(sourceArray: $todoManager.todos).presentationDetents([.medium])
            }
        }
    }
}

struct ToDoView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoView()
    }
}
