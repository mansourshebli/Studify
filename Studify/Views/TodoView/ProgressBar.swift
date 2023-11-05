import SwiftUI

struct ProgressBar: View {
    let todoManager: TodoManager

    var body: some View {
        GeometryReader { geometry in
            let completedCount = todoManager.todos.filter { $0.isCompleted }.count
            let totalCount = todoManager.todos.count
            let completionPercentage = totalCount > 0 ? Double(completedCount) / Double(totalCount) : 0.0

            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 10)
                    .opacity(0.3)
                    .foregroundColor(Color.blue)

                Rectangle()
                    .frame(width: min(CGFloat(completionPercentage) * geometry.size.width, geometry.size.width), height: 10)
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(todoManager: TodoManager())
            .frame(width: 200, height: 20)
    }
}
