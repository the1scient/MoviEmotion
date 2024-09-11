//
//  WelcomeView.swift
//  MoviEmotion
//
//  Created by MARIA MERCEDES DA SILVA RODRIGUES on 28/08/24.
//

import SwiftUI

struct WelcomeView: View {
    @Binding var isFirstLaunch: Bool
    @State private var usoCheck: Bool = false
    @State private var privacidadeCheck: Bool = false
    @State private var isShowingSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Fundo")
                    .resizable()
                    .ignoresSafeArea()
                
                VStack (alignment: .leading){
                    HStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .scaledToFit()
                            .padding(.bottom, -20)
                            .padding(.leading, -15)
                        
                    }
                
                    Spacer()
                    
                    Text("Bem-vindo ao \nMoviEmotion!")
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Spacer()
                    
                    Text("Escolha sua emoção e encontre o filme perfeito para você.")
                        .font(.system(size: 20))
                        .foregroundColor(.white)
                    
                    Spacer()
                        .frame(height: 20)
                    
                    Text("Vamos começar?")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text("Por favor, aceite os termos abaixo antes de prosseguir:")
                        .font(.system(size: 20))
                        .bold()
                        .foregroundColor(.white)
                    
                    Spacer()
                        .frame(height: 50)
                    
                    HStack {
                        Image(systemName: usoCheck ? "checkmark.circle" : "circle").font(.system(size: 21))
                            .onTapGesture {
                                usoCheck.toggle()
                            }
                            .foregroundColor(.white)
                        
                        TermsOfUseView()
                    }
                    
                    
                    HStack {
                        Image(systemName: privacidadeCheck ? "checkmark.circle" : "circle").font(.system(size: 21))
                            .onTapGesture {
                                privacidadeCheck.toggle()
                            }
                            .foregroundColor(.white)
                        PrivacyView()
                    }
                    
                    
                    Spacer()
                        .frame(height: 50)
                    
                    NavigationLink(destination: UserInfosView(isFirstLaunch: $isFirstLaunch)) {
                        Text("Próximo")
                            .foregroundColor(.white)
                        Image(systemName: "arrow.right")
                            .foregroundColor(.white)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .offset(x: 200)
                    .disabled(usoCheck == false)
                    .disabled(privacidadeCheck == false)
                   
                }
                .padding(30)
            }
         
        }
    }
}

#Preview {
    WelcomeView(isFirstLaunch: .constant(true))
}
