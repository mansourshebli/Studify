import SwiftUI

struct NewLongTermGoal: View {
    @State private var title = ""
    @State private var subtaskText = ""
    @State private var subtaskTitles: [String] = [""]
    
    @Binding var sourceArray: [LongTermGoal]
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Form {
            Section {
                TextField("Title", text: $title)
            }
            
            Section(header: Text("Subtasks")) {
                ForEach(subtaskTitles.indices, id: \.self) { index in
                    TextField("Subtask \(index + 1)", text: $subtaskTitles[index])
                        .onSubmit {
                            if index == subtaskTitles.count - 1 {
                                subtaskTitles.append("")
                            }
                        }
                }
                .onDelete { indexSet in
                    subtaskTitles.remove(atOffsets: indexSet)
                }
            }
            
            Section {
                Button("Save") {
                    let subtasks = subtaskTitles
                        .filter { !$0.isEmpty }
                        .map { title in
                            Subtask(title: title, isCompleted: false)
                        }
                    
                    let goal = LongTermGoal(id: UUID(), title: title, subtasks: subtasks)
                    sourceArray.append(goal)
                    dismiss()
                }
                .disabled(subtaskTitles[0].isEmpty)
                
                Button("Cancel", role: .destructive) {
                    dismiss()
                }
            }
        }
    }
}


#Preview {
    NewLongTermGoal(sourceArray: .constant([]))
}
