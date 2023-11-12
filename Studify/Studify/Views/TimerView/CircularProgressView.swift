//
//  CircularProgressView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 02/10/2023.
//

import SwiftUI

// Struct to display a circular progress view for a timer
struct CircularProgressView: View {
    // Binding for the progress value as a Double
    @Binding var timerProgress: Double

    var body: some View {
        ZStack {
            // Base circle with low opacity to show the background
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(Color.gray)
                .frame(width: 320, height: 320)

            // Dynamic circle that represents the progress
            Circle()
                .trim(from: 0, to: CGFloat(timerProgress))
                .stroke(style: .init(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.blue)
                .frame(width: 320, height: 320)
                .rotationEffect(Angle(degrees: -90)) // Rotates the circle to start from the top
        }
    }
}

#Preview {
    CircularProgressView(timerProgress: .constant(0.25))
}
