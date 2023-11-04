import SwiftUI

struct LongTermGoalsView: View {
    @ObservedObject var longTermGoalsManager = LongTermGoalsManager() // Create an instance of LongTermGoalsManager

    var body: some View {
        NavigationView {
            List($longTermGoalsManager.longTermGoals) { $goal in
                NavigationLink(destination: LongTermGoalDetailView(goal: goal)) {
                    VStack(alignment: .leading) {
                        Text(goal.title)
                            .font(.headline)
                        
                        ProgressBar(value: goal.progress)
                        
                        if goal.progress < 1.0 {
                            Text("Tap to view subtasks")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }
            .navigationTitle("Long Term Goals")
        }
        .onAppear {
            longTermGoalsManager.loadSampleData() // Load sample data if needed
        }
    }
}


struct LongTermGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        LongTermGoalsView()
    }
}
