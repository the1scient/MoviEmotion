//
//  MoviEmotionApp.swift
//  MoviEmotion
//
//  Created by GUILHERME FAGGION FABBRI on 26/08/24.
//

import SwiftUI

@main
struct MoviEmotionApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    var body: some View {
        NavigationView {
            if isFirstLaunch {
                // Exibe WelcomeView apenas na primeira vez
                WelcomeView(isFirstLaunch: $isFirstLaunch)
            } else {
                // Exibe DecisionView nas outras vezes
                DecisionView()
            }
        }
    }
}
