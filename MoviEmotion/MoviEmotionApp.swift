import SwiftUI
import SDWebImageSwiftUI

@main
struct MoviEmotionApp: App {
    @State private var isSplashScreenActive = true
    
    var body: some Scene {
        WindowGroup {
            if isSplashScreenActive {
                SplashScreen(isSplashScreenActive: $isSplashScreenActive)
            } else {
                ContentView()
            }
        }
    }
}

struct SplashScreen: View {
    @Binding var isSplashScreenActive: Bool
    let gifURL = URL(string: "https://s1.ezgif.com/tmp/ezgif-1-d2478cb5b3.gif") // Substitua pela URL do seu GIF
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            if let url = gifURL {
                WebImage(url: url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 310, height: 310)
                    .clipped()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                withAnimation {
                    isSplashScreenActive = false
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

