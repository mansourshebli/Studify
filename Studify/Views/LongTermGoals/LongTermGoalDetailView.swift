//
//  LongTermGoalDetailView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 05/11/2023.
//

import SwiftUI

struct LongTermGoalDetailView: View {
    @Binding var goal: LongTermGoal
    
    var body: some View {
        VStack {
            Text(goal.title)
                .font(.title)
                .padding()
            
            List(goal.subtasks) { subtask in
                HStack {
                    Text(subtask.title)
                    Spacer()
                    if subtask.isCompleted {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "circle")
                            .foregroundColor(.gray)
                    }
                }
                .onTapGesture {
                    toggleSubtaskCompletion(subtask)
                }
            }
        }
        .navigationTitle("Goal Details")
    }
    
    private func toggleSubtaskCompletion(_ subtask: Subtask) {
        if let index = goal.subtasks.firstIndex(where: { $0.id == subtask.id }) {
            goal.subtasks[index].isCompleted.toggle()
        }
    }
}
#Preview {
    LongTermGoalDetailView(goal: .constant(LongTermGoal(title: "Complete Project A", subtasks: [
        Subtask(title: "Research"),
        Subtask(title: "Design"),
        Subtask(title: "Development"),
        Subtask(title: "Testing"),
        Subtask(title: "Documentation"),
    ])))
}
