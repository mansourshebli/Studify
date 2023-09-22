//
//  TimerView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 31/08/2023.
//


import SwiftUI

struct TimerView: View {
    
    // Pairs of technique names and their corresponding colors
    private let techniquesWithColors: [(String, Color)] = [
        ("Pomodoro", Color.blue),
        ("4-4-4-4 Method", Color.orange),
        ("The 52-17 Method", Color.red)
    ]
    
    // Defining a grid with adaptive columns
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                /* >Note:
                 We use a lazy horizontal grid when you want to display a large, horizontally scrollable collection of views arranged in a two dimensional layout.
                 _source: google_
                 */
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    // Iterate through the technique-color pairs
                    ForEach(techniquesWithColors, id: \.0) { (technique, color) in
                        ZStack {
                            // Created a colored rectangle as a background
                            Rectangle()
                                .frame(width: 170, height: 170)
                                .foregroundColor(color)
                                .cornerRadius(25)
                            
                            // Displaying the technique name on top of the rectangle
                            Text(technique)
                                .foregroundColor(.white)
                                .font(.system(size: 20, design: .rounded))
                        }
                    }
                }
            }
            .navigationTitle("Techniques") // Set the navigation title
            .padding() // Add padding to the content
        }
    }
}


struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}
