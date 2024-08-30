//
//  UserInfosView.swift
//  MoviEmotion
//
//  Created by MARIA MERCEDES DA SILVA RODRIGUES on 28/08/24.
//

import SwiftUI

struct UserInfosView: View {
    @State private var nome: String = ""
    @State private var dataNascimento = Date()
    
    private var maxData: Date {
            Calendar.current.date(byAdding: .year, value: -6, to: Date())!
        }
    
    private let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/mm/yy"
            return formatter
        }()

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
                    .frame(width: 348, height: 40)
                    .multilineTextAlignment(.center)
                    .background(Color.black)
                    .cornerRadius(20)
                
                Spacer()
                    .frame(height: 40)
                
                Text("Data de Nascimento:")
                    .font(.system(size: 18))
            }
            .padding(20)
        
                DatePicker("Date", selection: $dataNascimento,in: ...maxData, displayedComponents: .date)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .frame(width: 300, height: 330)
                    .background()

                Spacer()
                    .frame(height: 30)
        
                    NavigationLink(destination: DecisionView()){
                        Text("Concluir")
                    }
                    .disabled(nome == "")
        
                    .padding(.horizontal, 140)
                    .padding(.vertical, 10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(20)
            
                    Spacer()
                        .frame(height: 30)
        }
    }

#Preview {
    UserInfosView()
}
