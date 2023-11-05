//
//  ProgressBar.swift
//  Studify
//
//  Created by Mansour Mohammed Alshebli on 04/11/2023.
//

import SwiftUI

struct ProgressBar: View {
    var value: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle()
                    .frame(width: geometry.size.width, height: 8)
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                Rectangle()
                    .frame(width: min(CGFloat(self.value) * geometry.size.width, geometry.size.width), height: 8)
                    .foregroundColor(.blue)            }
        }
    }
}


#Preview {
    ProgressBar(value: 100.0)
}
