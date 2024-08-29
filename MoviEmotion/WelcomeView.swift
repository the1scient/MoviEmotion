import SwiftUI

struct Opcao: Identifiable {
    let id = UUID()
    let texto: String
    var marcado: Bool
}

struct WelcomeView: View {
    @State private var opcoes = [
        Opcao(texto: "Termos de Uso", marcado: false),
        Opcao(texto: "Termos de Privacidade", marcado: false)
    ]
    
    @AppStorage("NOME_USUARIO") var nomeUsuario: String = ""
    @AppStorage("NASCIMENTO_USUARIO") var nascimentoUsuario: String = ""
    
    var logado: Bool {
        !nomeUsuario.isEmpty && !nascimentoUsuario.isEmpty
    }
    
    var body: some View {
        if logado {
            DecisionView() // Navigate to the logged-in view if user data is present
        } else {
            NavigationView {
                VStack(alignment: .leading) {
                    Text("Bem-vindo ao \nMoviEmotion!")
                        .font(.title)
                    
                    Spacer()
                    
                    Text("blablabla")
                    
                    Spacer()
                    
                    Text("Aceite os termos abaixo antes \nde prosseguir:")
                        .font(.system(size: 20))
                    
                    List($opcoes) { $opcao in
                        HStack {
                            Image(systemName: opcao.marcado ? "checkmark.square" : "square")
                                .onTapGesture {
                                    opcao.marcado.toggle()
                                }
                            Text(opcao.texto)
                                .underline()
                        }
                    }
                    .frame(height: 150)
                    
                    NavigationLink(destination: UserInfosView()) {
                        Text("Próximo")
                        Image(systemName: "arrow.right")
                    }
                    .buttonStyle(PlainButtonStyle())
                    .offset(x: 250)
                }
                .padding(30)
            }
        }
    }
}

#Preview {
    WelcomeView()
}
