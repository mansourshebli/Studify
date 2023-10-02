//
//  ContentView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 31/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            // TDO: Adding Views
            
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
