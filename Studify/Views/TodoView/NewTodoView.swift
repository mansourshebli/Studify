import SwiftUI

struct NewTodoView: View {
    @State private var title = ""
    @State private var subtitle = ""
    @Binding var sourceArray: [Todo]
    
    @State private var selectedPriority = TodoPriority.yellow
   
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
                TextField("Subtitle", text: $subtitle)
                
                Picker("Priority", selection: $selectedPriority) {
                    ForEach(TodoPriority.allCases, id: \.self) { priority in
                        Text(priority.rawValue).tag(priority)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            Section {
                Button("Save") {
                    let priorityColor: Color
                    switch selectedPriority {
                    case .red:
                        priorityColor = .red
                    case .orange:
                        priorityColor = .orange
                    case .yellow:
                        priorityColor = .yellow
                    }
                    let todo = Todo(
                        id: UUID(),
                        title: title,
                        subtitle: subtitle,
                        isCompleted: false,
                        priority: selectedPriority,
                        priorityColor: priorityColor
                    )
                    sourceArray.append(todo)
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
        NewTodoView(sourceArray: .constant([]))
    }
}
