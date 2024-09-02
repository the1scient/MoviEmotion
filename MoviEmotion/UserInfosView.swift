import SwiftUI

struct UserInfosView: View {
    @Binding var isFirstLaunch: Bool
    @State private var nome: String = ""
    @State private var dataNascimento = Date()
    
    private var maxData: Date {
        Calendar.current.date(byAdding: .year, value: -6, to: Date())!
    }
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yy" // Corrigido para MM em maiúsculo para mês
        return formatter
    }()

    var body: some View {
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
                .frame(width: 300, height: 330)
            
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
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(20)
            }
            .disabled(nome.isEmpty)
            
            Spacer()
                .frame(height: 30)
        }
        .padding(20)
        //.navigationBarBackButtonHidden(true) // Esconde o botão "Back"
    }
}

#Preview {
    UserInfosView(isFirstLaunch: .constant(true))
}
