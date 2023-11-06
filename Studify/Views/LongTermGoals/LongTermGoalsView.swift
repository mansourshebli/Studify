import SwiftUI

struct LongTermGoalsView: View {
    @State private var showSheet = false
    @StateObject var goalManager = LongTermGoalsManager()
    
    var body: some View {
        NavigationView {
            List($goalManager.goals, editActions: [.all]) { $goal in
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
                NewLongTermGoal(sourceArray: $goalManager.goals)
            }
            
        }
    }
}
#Preview {
    LongTermGoalsView()
}
