import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    
    var body: some View {
        VStack {
            Button {
                isDarkMode.toggle()
            } label: {
                Image(systemName: isDarkMode ? "moon" : "sun.max")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 48, height: 48)
                    .foregroundColor(isDarkMode ? .white : .black)
            }
            .offset(x: 150)
            .preferredColorScheme(isDarkMode ? .dark : .light)

            TabView {
                DashboardView()
                    .tabItem {
                        Label("Dashboard", systemImage: "house")
                    }
                
                ToDoView()
                    .tabItem {
                        Label("ToDo", systemImage: "list.bullet.clipboard")
                    }
                
                TimerView()
                    .tabItem {
                        Label("Timer", systemImage: "timer")
                    }
                
                LongTermGoalsView()
                    .tabItem {
                        Label("Goals", systemImage: "star")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
