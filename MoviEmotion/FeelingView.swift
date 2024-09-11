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
        EmotionCategory(id: "10749", name: "Amor", genre: "Romance", startColor: Color(red: 193/255, green: 137/255, blue: 151/255), endColor: Color(red: 184/255, green: 13/255, blue: 13/255), imageName: "Amor"),
        EmotionCategory(id: "28", name: "Raiva", genre: "Ação", startColor: Color(red: 193/255, green: 13/255, blue: 13/255), endColor: Color(red: 68/255, green: 1/255, blue: 1/255), imageName: "Raiva"),
        EmotionCategory(id: "12,14", name: "Frustração", genre: "Crime", startColor: Color( red: 65/255, green: 0/255, blue: 0/255), endColor: Color(red: 98/255, green: 7/255, blue: 7/255), imageName: "Frustracao"),
        EmotionCategory(id: "10402,35", name: "Ansiedade", genre: "Mistério", startColor: Color( red: 203/255, green: 63/255, blue: 2/255), endColor: Color(red: 2/255, green: 30/255, blue: 104/255), imageName: "Ansiedade"),
        EmotionCategory(id: "18,35", name: "Tristeza", genre: "Comedia e Aventura", startColor: Color( red: 13/255, green: 44/255, blue: 123/255), endColor: Color(red: 3/255, green: 9/255, blue: 80/255), imageName: "Tristeza"),
        EmotionCategory(id: "10770", name: "Medo", genre: "Terror", startColor: Color(red: 3/255, green: 9/255, blue: 100/255), endColor: Color(red: 3/255, green: 9/255, blue: 50/255), imageName: "Medo"),
        EmotionCategory(id: "35", name: "Alegria", genre: "Comédia", startColor: Color(red: 251/255, green: 210/255, blue: 0/255), endColor: Color(red: 1/255, green: 81/255, blue: 69/255), imageName: "Alegria"),
        EmotionCategory(id: "99", name: "Curiosidade", genre: "Ficção Científica", startColor: Color(red: 26/255, green: 109/255, blue: 63/255), endColor: Color(red: 152/255, green: 170/255, blue: 167/255), imageName: "Curiosidade"),
        EmotionCategory(id: "37", name: "Tédio", genre: "Documentário", startColor: Color(red: 133/255, green: 159/255, blue: 152/255), endColor: Color(red: 200/255, green: 197/255, blue: 197/255), imageName: "Tedio")
    ]
    
    var body: some View {
            VStack {
                
                Spacer().frame(height: 50)
                
                Text("O que você\n está sentindo?")
                    .font(.system(size: 25))
                    .bold()
                    .multilineTextAlignment(.center)
                
                Spacer().frame(height: 40)
                
                VStack {
                     ForEach(0..<3) { row in
                         HStack(spacing: 20) {
                             ForEach(0..<3) { col in
                                 let index = row * 3 + col
                                 VStack {
                                     
                                     NavigationLink(destination: RecommendationView(categorie: emotions[index].id)) {
                                         VStack {
                                             ZStack {
                                                 Circle()
                                                     .fill(LinearGradient(
                                                         gradient: Gradient(colors: [emotions[index].startColor, emotions[index].endColor]),
                                                         startPoint: .leading,
                                                         endPoint: .trailing
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
                                     Text(emotions[index].name)
                                         .bold().font(.system(size: 16))
                                         .padding(-15)
                                         .padding(.bottom)
                                         
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
