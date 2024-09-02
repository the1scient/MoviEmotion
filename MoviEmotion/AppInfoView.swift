import SwiftUI

struct AppInfoView: View {
    var body: some View {
            VStack (alignment: .leading) {
                Text("Sobre o MoviEmotion")
                    .font(.title)
                
                Spacer()
                    .frame(height: 50)
                
                Text("MoviEmotion é um app que recomenda filmes com base nas suas emoções. Escolha como você está se sentindo, ou como quer se sentir, e descubra filmes que combinam com o seu momento.")
                    .font(.system(size: 15))
                
                Spacer()
                    .frame(height: 30)
                
                Text("Atribuição da Fonte de Dados")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Os dados fornecidos pelo MoviEmotion tem como fonte dos dados a JustWatch, parceira da TMDB.")
                    .font(.system(size: 15))
                
                Spacer()
                    .frame(height: 30)
                
                Text("Desenvolvedores")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("MoviEmotion é desenvolvido por uma equipe dedicada, que teve como objetivo combinar tecnologia e cinema. Gostariamos de tornar sua experiência de assistir a filmes mais personalizada e significativa.")
                    .font(.system(size: 15))
                
                Spacer()
                    .frame(height: 10)
                
                Text("Equipe:")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Alissa Mikki Usami Yoshioka \nCamila Abreu de Souza \nGuilherme Faggion Fabbri \nMaria Mercedes da Silva Rodrigues \nMatheus da Silva Marini")
                    .font(.system(size: 15))
                
            }
            .padding(30)
    }
}

#Preview {
    AppInfoView()
}
