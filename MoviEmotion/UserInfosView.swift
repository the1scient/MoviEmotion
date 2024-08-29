import SwiftUI

struct UserInfosView: View {
    @AppStorage("NOME_USUARIO") private var nomeUsuario: String = ""
    @AppStorage("NASCIMENTO_USUARIO") private var nascimentoUsuario: String = ""
    
    @State private var nome: String = ""
    @State private var dataNascimento = Date.now
    
    var body: some View {
        VStack(alignment: .leading) {
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
                        .inset(by: 5)
                        .stroke(.gray, lineWidth: 1)
                )
            
            Spacer()
                .frame(height: 40)
            
            Text("Data de Nascimento:")
                .font(.system(size: 18))
            
            DatePicker("Enter your birthday", selection: $dataNascimento, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(width: 300, height: 330)
                .background()
            
            Spacer()
                .frame(height: 30)
            
            NavigationLink(destination: FeelingView()) {
                Text("Concluir")
            }
            .disabled(nome.isEmpty || dataNascimento == Date.now)
            .padding(.horizontal, 140)
            .padding(.vertical, 10)
            .foregroundColor(.white)
            .background(.gray)
            .cornerRadius(20)
            .onTapGesture {
                saveUserData()
            }
            
            Spacer()
                .frame(height: 30)
        }
        .padding(20)
    }
    
    private func saveUserData() {
        nomeUsuario = nome
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        nascimentoUsuario = formatter.string(from: dataNascimento)
    }
}

#Preview {
    UserInfosView()
}
