import SwiftUI

struct UserInfosView: View {
    @Binding var isFirstLaunch: Bool
    @State private var nome: String = ""
    @State private var dataNascimento = Date()
    @Environment(\.colorScheme) var colorScheme
    
    private var maxData: Date {
        Calendar.current.date(byAdding: .year, value: -6, to: Date())!
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy"
        return formatter
    }()

    var body: some View {
        ScrollView { 
            VStack(alignment: .leading) {
                Spacer()
                
                Text("Perfil")
                    .font(.system(size: 25))
                    .bold()
                
                Spacer()
                
                Text("Como você gostaria de ser chamado:")
                    .font(.system(size: 18))
                
                Spacer()
                    .frame(height: 20)
                
                TextField("Digite um nome", text: $nome)
                    .frame(width: 348, height: 40)
                    .multilineTextAlignment(.center)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                
                Spacer()
                    .frame(height: 40)
                
                Text("Data de Nascimento:")
                    .font(.system(size: 18))
                    DatePicker("Date", selection: $dataNascimento, in: ...maxData, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .frame(width: .infinity, height: 330,alignment: .center)
                
                Spacer()
                    .frame(height: 30)
                
                Button(action: {
                    if !nome.isEmpty {
                        UserDefaults.standard.set(nome, forKey: "UserName")
                        isFirstLaunch = false
                    }
                }) {
                    Text("Concluir")
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 10)
                        .foregroundColor(.white)
                        .background(.gray)
                        .cornerRadius(20)

                }
                .disabled(nome.isEmpty)
                
                
            }
            .padding(20)
        }
        //.navigationBarBackButtonHidden(true) // Esconde o botão "Back"
    }
}

#Preview {
    UserInfosView(isFirstLaunch: .constant(true))
}
