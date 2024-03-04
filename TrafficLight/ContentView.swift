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
            Circle()
                .frame(width: 100, height: 100)
                .foregroundStyle(.red)
                .opacity(redAlpha)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(color: Color.red, radius: 10 )
            
            Circle()
                .foregroundStyle(.yellow)
                .opacity(yellowAlpha)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(color: Color.yellow, radius: 10 )
                .padding(15)
            
            Circle()
                .foregroundStyle(.green)
                .opacity(greenAlpha)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(color: Color.green, radius: 10 )
            
            Spacer()
            
            Button {
                tapButton()
            } label: {
                Text("\(text)")
                    .font(.system(.title, design: .rounded, weight: .heavy))
                    .foregroundColor(.black)
                    .frame(width: 150, height: .infinity)
                    .padding(.vertical, 15)
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .cornerRadius(20.0)
            }
        }
        .padding(50)
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
