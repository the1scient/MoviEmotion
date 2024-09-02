import SwiftUI
import SDWebImageSwiftUI

struct SplashScreen: View {
    // URL do GIF
    let gifURL = URL(string: "https://s1.ezgif.com/tmp/ezgif-1-d2478cb5b3.gif") // Substitua pela URL do seu GIF
    
    // Estado para controlar a visibilidade do GIF e navegação para a ContentView
    @State private var navigateToContentView = false

    var body: some View {
        ZStack {
            // Fundo branco
            Color.white.ignoresSafeArea()
            
            // Exibir o GIF
            if let url = gifURL {
                WebImage(url: url)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 310, height: 310)
                    .clipped()
                
            }
            
               if navigateToContentView {
                ContentView()
            }
        }
        .onAppear {
            // Temporizador para redirecionar para a ContentView após o GIF
            DispatchQueue.main.asyncAfter(deadline: .now() + 10) { // Ajuste o tempo conforme necessário
                withAnimation {
                    navigateToContentView = true
                }
            }
        }
    }
}
