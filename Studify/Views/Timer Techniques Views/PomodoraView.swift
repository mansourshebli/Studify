//
//  PomodoraView.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 23/09/2023.
//

import SwiftUI

struct PomodoraView: View {
    @State private var timer: Timer?
    @State private var timerDuration = 1500
    @State private var isTimerOn = false
    
    var body: some View {
        VStack{
            
            Text(String(format: "%02d:%02d", timerDuration / 60, timerDuration % 60))

        }
        
    }
    func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
}

#Preview {
    PomodoraView()
}
