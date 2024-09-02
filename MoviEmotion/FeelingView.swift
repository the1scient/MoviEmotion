import SwiftUI

// Estrutura para armazenar sentimento, gênero, ID e cor
struct EmotionCategory {
    let id: String
    let name: String
    let genre: String
    let startColor: Color
    let endColor: Color
    let imageName: String
}

struct FeelingView: View {
    // Lista de sentimentos associados aos gêneros de filmes e IDs
    let emotions = [
        EmotionCategory(id: "10749", name: "Amor", genre: "Romance", startColor: Color(red: 0.9, green: 0.3, blue: 0.3), endColor: Color(red: 0.7, green: 0.1, blue: 0.1), imageName: "Amor"),
        EmotionCategory(id: "28", name: "Raiva", genre: "Ação", startColor: Color(red: 0.8, green: 0.2, blue: 0.1), endColor: Color(red: 0.7, green: 0.0, blue: 0.0), imageName: "Raiva"),
        EmotionCategory(id: "80", name: "Frustração", genre: "Crime", startColor: Color(red: 0.6, green: 0.1, blue: 0.1), endColor: Color(red: 0.5, green: 0.0, blue: 0.0), imageName: "Frustracao"),
        EmotionCategory(id: "9648", name: "Ansiedade", genre: "Mistério", startColor: Color(red: 0.6, green: 0.4, blue: 0.2), endColor: Color(red: 0.5, green: 0.3, blue: 0.1), imageName: "Ansiedade"),
        EmotionCategory(id: "18", name: "Tristeza", genre: "Drama", startColor: Color(red: 0.5, green: 0.1, blue: 0.1), endColor: Color(red: 0.4, green: 0.0, blue: 0.0), imageName: "Tristeza"),
        EmotionCategory(id: "27", name: "Medo", genre: "Terror", startColor: Color(red: 0.5, green: 0.2, blue: 0.2), endColor: Color(red: 0.4, green: 0.0, blue: 0.0), imageName: "Medo"),
        EmotionCategory(id: "35", name: "Alegria", genre: "Comédia", startColor: Color(red: 0.9, green: 0.8, blue: 0.2), endColor: Color(red: 0.8, green: 0.6, blue: 0.0), imageName: "Alegria"),
        EmotionCategory(id: "878", name: "Curiosidade", genre: "Ficção Científica", startColor: Color(red: 0.3, green: 0.5, blue: 0.5), endColor: Color(red: 0.2, green: 0.4, blue: 0.3), imageName: "Curiosidade"),
        EmotionCategory(id: "99", name: "Tédio", genre: "Documentário", startColor: Color(red: 0.7, green: 0.7, blue: 0.7), endColor: Color(red: 0.6, green: 0.6, blue: 0.6), imageName: "Tedio")
    ]
    
    var body: some View {
            VStack {
                
                Spacer().frame(height: 50)
                
                Text("O que você\n está sentindo?")
                    .font(.system(size: 25))
                    .bold()
                    .multilineTextAlignment(.center)
                
                Spacer().frame(height: 80)
                
                VStack {
                     ForEach(0..<3) { row in
                         HStack(spacing: 20) {
                             ForEach(0..<3) { col in
                                 let index = row * 3 + col
                                 VStack {
                                     Text(emotions[index].name)
                                         .bold().font(.system(size: 16))
                                         .padding(-15)
                                     
                                     NavigationLink(destination: RecommendationView(categorie: emotions[index].id)) {
                                         VStack {
                                             ZStack {
                                                 Circle()
                                                     .fill(LinearGradient(
                                                         gradient: Gradient(colors: [emotions[index].startColor, emotions[index].endColor]),
                                                         startPoint: .topLeading,
                                                         endPoint: .bottomTrailing
                                                     ))
                                                     .frame(width: 100, height: 150)
                                                 
                                                 Image(emotions[index].imageName)
                                                     .resizable()
                                                     .scaledToFit()
                                                     .frame(width: 75, height: 75)
                                                     .clipShape(Circle())
                                             }
                                         }
                                     }
                                 }
                             }
                         }
                     }
                 }
                
                Spacer()
            }

        }
    }



#Preview {
    FeelingView()
}
