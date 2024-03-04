//
//  ContentView.swift
//  TrafficLight
//
//  Created by Dmitry Parhomenko on 29.02.2024.
//

import SwiftUI

struct ContentView: View {
    
    enum CurrentLight {
        case red, yellow, green
    }
    
    @State private var text = "START"
    @State private var redAlpha = 0.3
    @State private var yellowAlpha = 0.3
    @State private var greenAlpha = 0.3
    @State var currentLight: CurrentLight
    
    init(currentLight: CurrentLight) {
        self.currentLight = currentLight
    }
    
    var body: some View {
        ZStack{
            Color(.gray).ignoresSafeArea()
            
            VStack {
                CircleView(color: .red, opacity: redAlpha)
                CircleView(color: .yellow, opacity: yellowAlpha)
                    .padding(10)
                CircleView(color: .green, opacity: greenAlpha)
                
                Spacer()
                
                StartButtonView(title: text, color: .blue) {
                    if text == "START" {
                        text = "NEXT"
                    }
                        nextColor()
                }
            }
            .padding()
        }
    }
    
    private func nextColor() {
        
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
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
    
}

#Preview {
    ContentView(currentLight: .red)
}
