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
    @State private var currentLight = CurrentLight.red
    
     private let lightIsOn = 1.0
     private let lightIsOff = 0.3
    
    var body: some View {
        
        VStack {
            Circle()
                .foregroundStyle(Color.red)
                .opacity(redAlpha)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(color: Color.red, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
            
            Circle()
                .foregroundStyle(Color.yellow)
                .opacity(yellowAlpha)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                .shadow(color: Color.yellow, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
                .padding(15)
            
            Circle()
                .foregroundStyle(Color.green)
                .opacity(greenAlpha)
                .frame(width: 100, height: 100)
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .shadow(color: Color.green, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/ )
            
            Spacer()
            
            Button {
                tapButton()
            } label: {
                Text("\(text)")
                    .font(.system(.title, design: .rounded, weight: .heavy))
                    .foregroundColor(.black)
            }
            .padding(EdgeInsets(top: 15, leading: 30, bottom: 15, trailing: 30))
            .background(
                LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(20.0)
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
}

// MARK: - CurrentLight
extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView()
}
