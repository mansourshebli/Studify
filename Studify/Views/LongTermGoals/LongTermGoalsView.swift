//
//  LongTermGoalsView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 05/11/2023.
//

import SwiftUI

struct LongTermGoalsView: View {
    @State private var showSheet = false
    @State private var longTermGoals = [
        LongTermGoal(title: "Complete Project A", subtasks: [
            Subtask(title: "Research"),
            Subtask(title: "Design"),
            Subtask(title: "Development"),
            Subtask(title: "Testing"),
            Subtask(title: "Documentation"),
        ]),
       
        LongTermGoal(title: "Complete Project B", subtasks: [
            Subtask(title: "Research"),
            Subtask(title: "Design"),
            Subtask(title: "Development"),
            Subtask(title: "Testing"),
            Subtask(title: "Documentation"),
        ]),
        
    ]
    
    var body: some View {
        NavigationView {
            List($longTermGoals, editActions: [.all]) { $goal in
                NavigationLink(destination: LongTermGoalDetailView(goal: $goal)) {
                    VStack(alignment: .leading) {
                        Text(goal.title)
                            .font(.headline)
                        
                        ProgressView(value: goal.progress)
                            
                            Text("Tap to view subtasks")
                                .font(.caption)
                                .foregroundColor(.blue)
                    }
                }
            }
            .navigationTitle("Long Term Goals")
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
                NewLongTermGoal(sourceArray: $longTermGoals)
            }
            
        }
    }
}
#Preview {
    LongTermGoalsView()
}
