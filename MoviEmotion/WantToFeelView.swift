//
//  WantToFeelView.swift
//  MoviEmotion
//
//  Created by MATHEUS DA SILVA MARINI on 28/08/24.
//

import SwiftUI

struct WantToFeelView: View {
    let emotions = [
        EmotionCategory(id: "10749", name: "Amor", genre: "Romance", startColor: Color(red: 0.9, green: 0.3, blue: 0.3), endColor: Color(red: 0.7, green: 0.1, blue: 0.1)),
        EmotionCategory(id: "28", name: "Raiva", genre: "Ação", startColor: Color(red: 0.8, green: 0.2, blue: 0.1), endColor: Color(red: 0.7, green: 0.0, blue: 0.0)),
        EmotionCategory(id: "80", name: "Frustração", genre: "Crime", startColor: Color(red: 0.6, green: 0.1, blue: 0.1), endColor: Color(red: 0.5, green: 0.0, blue: 0.0)),
        EmotionCategory(id: "9648", name: "Ansiedade", genre: "Mistério", startColor: Color(red: 0.6, green: 0.4, blue: 0.2), endColor: Color(red: 0.5, green: 0.3, blue: 0.1)),
        EmotionCategory(id: "18", name: "Tristeza", genre: "Drama", startColor: Color(red: 0.5, green: 0.1, blue: 0.1), endColor: Color(red: 0.4, green: 0.0, blue: 0.0)),
        EmotionCategory(id: "27", name: "Medo", genre: "Terror", startColor: Color(red: 0.5, green: 0.2, blue: 0.2), endColor: Color(red: 0.4, green: 0.0, blue: 0.0)),
        EmotionCategory(id: "35", name: "Alegria", genre: "Comédia", startColor: Color(red: 0.9, green: 0.8, blue: 0.2), endColor: Color(red: 0.8, green: 0.6, blue: 0.0)),
        EmotionCategory(id: "878", name: "Curiosidade", genre: "Ficção Científica", startColor: Color(red: 0.3, green: 0.5, blue: 0.5), endColor: Color(red: 0.2, green: 0.4, blue: 0.3)),
        EmotionCategory(id: "99", name: "Tédio", genre: "Documentário", startColor: Color(red: 0.7, green: 0.7, blue: 0.7), endColor: Color(red: 0.6, green: 0.6, blue: 0.6))
    ]
    
    var body: some View {
        VStack {
            
            Spacer().frame(height: 50)
            
            Text("O que você\n quer sentir?")
                .font(.system(size: 25))
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 80)
            
            VStack() {
                // Criando os botões com diferentes sentimentos, gêneros e IDs
                ForEach(0..<3) { row in
                    HStack(spacing: 20) {
                        ForEach(0..<3) { col in
                            let index = row * 3 + col
                            VStack {
                                Text(emotions[index].name)
                                    .bold().font(.system(size: 16))
                                    .padding(-15)
                                
                                NavigationLink(destination: RecommendationView(categorie: emotions[index].id)) {
                                    Circle()
                                        .fill(LinearGradient(
                                            gradient: Gradient(colors: [emotions[index].startColor, emotions[index].endColor]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        ))
                                        .frame(width: 100, height: 150)
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
    WantToFeelView()
}
