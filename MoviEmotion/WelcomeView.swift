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
            VStack (alignment: .leading){
                Spacer()
                Text("Bem-vindo ao \nMoviEmotion!")
                    .font(.title)
                
                Spacer()
                
                Text("Escolha sua emoção e encontre o filme perfeito para você.")
                    .font(.system(size: 18))
                
                Spacer()
                    .frame(height: 20)
                
                Text("Vamos começar?")
                
                Spacer()
                
                Text("Aceite os termos abaixo antes \nde prosseguir:")
                    .font(.system(size: 20))
                
                Spacer()
                    .frame(height: 50)
                
                HStack {
                    Image(systemName: usoCheck ? "checkmark.circle" : "circle")
                            .onTapGesture {
                                usoCheck.toggle()
                            }
                        
                    TermsOfUseView()
                }
                
                HStack {
                    Image(systemName: privacidadeCheck ? "checkmark.circle" : "circle")
                        .onTapGesture {
                            privacidadeCheck.toggle()
                        }
                    PrivacyView()
                }
                
                Spacer()
                    .frame(height: 50)
                
                NavigationLink(destination: UserInfosView(isFirstLaunch: $isFirstLaunch)) {
                    Text("Próximo")
                    Image(systemName: "arrow.right")
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

#Preview {
    WelcomeView(isFirstLaunch: .constant(true))
}
