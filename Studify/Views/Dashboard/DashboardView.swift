import SwiftUI

struct DashboardView: View {
    var body: some View {
        ZStack {
            Image("menu")
                .frame(width: 32, height: 32)
                .position(x: 45, y: 35)

            Text("Hi, Mansour 👋 ")
                .font(
                    Font.custom("Rubik-Regular", size: 20)
                        .weight(.bold)
                )
                .multilineTextAlignment(.center)
                .foregroundColor(Color(red: 0.18, green: 0.23, blue: 0.44))
                .frame(width: 141, alignment: .top)
                .position(x: 200, y: 35)
            
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 300, height: 150)
              .background(Color(red: 0.21, green: 0.62, blue: 1))
              .cornerRadius(20)
              .shadow(color: Color(red: 0.21, green: 0.62, blue: 1).opacity(0.4), radius: 15, x: 0, y: 10)
        }
        
    }
}

#Preview {
    DashboardView()
}
