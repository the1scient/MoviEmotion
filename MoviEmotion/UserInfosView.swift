//
//  UserInfosView.swift
//  MoviEmotion
//
//  Created by MARIA MERCEDES DA SILVA RODRIGUES on 28/08/24.
//

import SwiftUI

struct UserInfosView: View {
    @State private var nome: String = ""
    @State private var dataNascimento = Date.now
    
    var body: some View {
        VStack (alignment: .leading){
                Spacer()
                
                Text("Perfil")
                    .font(.title)
                    .font(.system(size: 25))
                    .bold()

                Spacer()
                
                Text("Como você gostaria de ser chamado:")
                    .font(.system(size: 18))
                
                Spacer()
                    .frame(height: 20)
                
                TextField("Enter your name", text: $nome)
                    .frame(width: 348, height: 36)
                    .multilineTextAlignment(.center)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .inset(by: 5) // inset value should be same as lineWidth in .stroke
                            .stroke(.gray, lineWidth: 1)
                    )
                
                Spacer()
                    .frame(height: 40)
                
                Text("Data de Nascimento:")
                    .font(.system(size: 18))
            }
            .padding(20)
        
                DatePicker("Enter your birthday", selection: $dataNascimento, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(width: 300, height: 330)
                    .background()
            
                Spacer()
                    .frame(height: 30)
        
                if nome != "" && dataNascimento != Date.now {
                    NavigationLink(destination: FeelingView()){
                        Text("Concluir")
                    }
                    .padding(.horizontal, 140)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(20)
            
                    Spacer()
                        .frame(height: 30)
            }
        }
    }

#Preview {
    UserInfosView()
}
