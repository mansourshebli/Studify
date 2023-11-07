import SwiftUI

struct ContentView: View {
    
    
    
    var body: some View {

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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
