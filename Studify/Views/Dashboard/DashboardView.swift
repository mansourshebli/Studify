import SwiftUI

struct DashboardView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false

    var body: some View {
        ZStack {
            
            Image("menu")
                .frame(width: 32, height: 32)
                .position(x: 45, y: 35)

            Text("Hi, Mansour 👋 ")
                .font(
                    Font.custom("Rubik-Regular", size: 26)
                )
                .multilineTextAlignment(.center)
                .frame(width: 300, alignment: .top)
                .position(x: 200, y: 35)
            
            Button {
                isDarkMode.toggle()
            } label: {
                Image(systemName: isDarkMode ? "moon" : "sun.max")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
                    .foregroundColor(isDarkMode ? .white : .black)
            }
            .position(x: 340, y: 35)
            .preferredColorScheme(isDarkMode ? .dark : .light)
            
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
