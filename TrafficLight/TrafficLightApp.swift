//
//  TrafficLightApp.swift
//  TrafficLight
//
//  Created by Dmitry Parhomenko on 29.02.2024.
//

import SwiftUI

@main
struct TrafficLightApp: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(currentLight: .red)
        }
    }
}
