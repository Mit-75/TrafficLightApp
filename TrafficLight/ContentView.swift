//
//  ContentView.swift
//  TrafficLight
//
//  Created by Dmitry Parhomenko on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var text = "START"
    @State private var redAlpha = 0.3
    @State private var yellowAlpha = 0.3
    @State private var greenAlpha = 0.3
    @State var currentLight: CurrentLight
    
     private let lightIsOn = 1.0
     private let lightIsOff = 0.3
    
    init(currentLight: CurrentLight) {
        self.currentLight = currentLight
    }
    
    var body: some View {
        
        VStack {
            CircleView(color: .red, opacity: redAlpha)
            CircleView(color: .yellow, opacity: yellowAlpha)
                .padding(10)
            CircleView(color: .green, opacity: greenAlpha)
            
            Spacer()
            
           StartButtonView(title: text, action: tapButton)
        }
        .padding(30)
    }
    
    private func tapButton() {
        text = ("NEXT")
        
        switch currentLight {
        case .red:
            greenAlpha = lightIsOff
            redAlpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redAlpha = lightIsOff
            yellowAlpha = lightIsOn
            currentLight = .green
        case .green:
            greenAlpha = lightIsOn
            yellowAlpha = lightIsOff
            currentLight = .red
        }
    }
    
    enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView(currentLight: .red)
}
