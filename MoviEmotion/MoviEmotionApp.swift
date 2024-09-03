import SwiftUI

@main
struct MoviEmotionApp: App {
    @State var isActive: Bool = false
    
    var body: some Scene {
        WindowGroup {
            SplashScreen(isActive: $isActive)
        }
    }
}

struct SplashScreen: View {
    @Binding var isActive: Bool

    var body: some View {
        ZStack {
            if self.isActive {
                ContentView()
            } else {
                AnimatedImageView()
                    .frame(width: 1100, height: 1100)
            }
        }
        .onAppear() {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.7) {
                withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}

struct ContentView: View {
    @AppStorage("isFirstLaunch") private var isFirstLaunch: Bool = true
    
    var body: some View {
        NavigationView {
            if isFirstLaunch {
                WelcomeView(isFirstLaunch: $isFirstLaunch)
            } else {
                DecisionView()
            }
        }
    }
}
