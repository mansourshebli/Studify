import SwiftUI

struct ContentView: View {
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
        VStack {
            Button{
                isDarkMode.toggle()
            }label: {
            Image(systemName: isDarkMode ? "moon" : "sun.max")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(isDarkMode ? .white : .black)
        }.preferredColorScheme(isDarkMode ? .dark : .light)
            
            

            TabView {
                Text("Dashboard")
                    .tabItem {
                        Label("Dashboard", systemImage: "house")
                    }
                
                ToDoView()
                    .tabItem {
                        Label("ToDo", systemImage: "list.bullet.clipboard")
                    }
                
                Text("Timer")
                    .tabItem {
                        Label("Timer", systemImage: "timer")
                    }
                
                Text("Goals")
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
