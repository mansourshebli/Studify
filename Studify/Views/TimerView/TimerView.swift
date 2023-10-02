//
//  TimerView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 31/08/2023.
//


import SwiftUI

struct TimerView: View {
    
    private let techniquesWithIcons: [(String, String, String, Color)] = [
        ("Pomodoro", "timer", "25 minutes work, 5 minutes break", Color.blue),
        ("4-4-4-4 Method", "stopwatch", "4 cycles of 25-min work", Color.orange),
        ("The 52-17 Method", "clock", "52 min work, 17 min break", Color.red),
        ("The 50-10 Rule", "hourglass", "50 minutes, 10-minute break", Color.green)
    ]
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 170))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(techniquesWithIcons, id: \.0) { (technique, iconName, description, color) in
                        ZStack {
                            // Add a gradient background
                            LinearGradient(gradient: Gradient(colors: [color, color.opacity(0.8)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                                .frame(width: 170, height: 170)
                                .cornerRadius(20) // Rounded corners
                                .shadow(color: Color.gray.opacity(0.5), radius: 5, x: 0, y: 2) // Shadow effect
                            
                            VStack {
                                Image(systemName: iconName)
                                    .foregroundColor(.white)
                                    .font(.system(size: 60))
                                
                                Text(technique)
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .padding(10) // Add padding to the text
                                    .background(Color.black.opacity(0.5)) // Background for text
                                    .cornerRadius(10) // Rounded corners for text background
                                
                                Text(description)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 14, weight: .regular, design: .rounded))
                                    .padding(.horizontal, 10)
                                    .padding(.bottom, 10)
                            }
                        }
                    }
                }
                .padding() // Add padding to the grid
            }
            .navigationTitle("Techniques")
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
