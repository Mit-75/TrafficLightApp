//
//  StartButtonView.swift
//  TrafficLight
//
//  Created by Dmitry Parhomenko on 04.03.2024.
//

import SwiftUI

struct StartButtonView: View {
    let title: String
    let color: Color
    let action: () -> Void
    var body: some View {
        Button(action: action)  {
            Text(title)
                .font(.title)
                .fontWeight(.heavy)
                .foregroundStyle(.white)
        }
        .frame(width: 200, height: 70)
        .background(color)
        .clipShape(.rect(cornerRadius: 20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.white, lineWidth: 5)
        )
        .shadow(color: color, radius: 10)
    }
}

#Preview {
    StartButtonView(title: "START", color: .blue , action: {})
}

