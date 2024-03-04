//
//  CircleView.swift
//  TrafficLight
//
//  Created by Dmitry Parhomenko on 04.03.2024.
//

import SwiftUI

struct CircleView: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 100)
            .foregroundStyle(color)
            .opacity(opacity)
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(color: color, radius: 10 )
    }
}

#Preview {
    CircleView(color: .red, opacity: 1)
}
