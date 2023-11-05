import SwiftUI

struct ProgressBar: View {
    let completionPercentage: Double

    var body: some View {
        GeometryReader { geometry in
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
        ProgressBar(completionPercentage: 0.7)
            .frame(width: 200, height: 20)
    }
}
