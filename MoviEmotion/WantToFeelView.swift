//
//  WantToFeelView.swift
//  MoviEmotion
//
//  Created by MATHEUS DA SILVA MARINI on 28/08/24.
//

import SwiftUI

struct WantToFeelView: View {
    let emotions = [
        EmotionCategory(id: "10749", name: "Amor", genre: "Romance", startColor: Color(red: 193/255, green: 137/255, blue: 151/255), endColor: Color(red: 184/255, green: 13/255, blue: 13/255), imageName: "Amor"),
        EmotionCategory(id: "18", name: "Tristeza", genre: "Drama", startColor: Color( red: 13/255, green: 44/255, blue: 123/255), endColor: Color(red: 3/255, green: 9/255, blue: 80/255), imageName: "Tristeza"),
        EmotionCategory(id: "27,53", name: "Medo", genre: "Terror", startColor: Color(red: 3/255, green: 9/255, blue: 100/255), endColor: Color(red: 3/255, green: 9/255, blue: 50/255), imageName: "Medo"),
        EmotionCategory(id: "35", name: "Alegria", genre: "Comédia", startColor: Color(red: 251/255, green: 210/255, blue: 0/255), endColor: Color(red: 1/255, green: 81/255, blue: 69/255), imageName: "Alegria"),
        EmotionCategory(id: "878", name: "Curiosidade", genre: "Ficção Científica", startColor: Color(red: 26/255, green: 109/255, blue: 63/255), endColor: Color(red: 152/255, green: 170/255, blue: 167/255), imageName: "Curiosidade"),
        EmotionCategory(id: "99", name: "Calmaria", genre: "Documentário", startColor: Color(red: 133/255, green: 159/255, blue: 152/255), endColor: Color(red: 200/255, green: 197/255, blue: 197/255), imageName: "Tedio")
    ]
    
    var body: some View {
        VStack {
            
            Spacer().frame(height: 50)
            
            Text("O que você\n quer sentir?")
                .font(.system(size: 25))
                .bold()
                .multilineTextAlignment(.center)
            
            Spacer().frame(height: 50)
            
            VStack {
                           ForEach(0..<2) { row in
                               HStack(spacing: 20) {
                                   ForEach(0..<3) { col in
                                       let index = row * 3 + col
                                       if index < 6 {
                                           VStack {

                                               
                                               NavigationLink(destination: RecommendationView(categorie: emotions[index].id)) {
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
                                               Text(emotions[index].name)
                                                   .bold()
                                                   .font(.system(size: 16))
                                                   .padding(-15)
                                                   .padding(.bottom)
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
