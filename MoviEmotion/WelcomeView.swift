

import SwiftUI


struct Opcao: Identifiable {
    let id = UUID()
    let texto: String
    var marcado: Bool
}

struct WelcomeView: View {
    @State private var opcoes = [Opcao(texto: "Termos de Uso", marcado: false), Opcao(texto: "Termos de Privacidade", marcado: false)]
    
    var body: some View {
        NavigationView {
            VStack (alignment: .leading){
                Text("Bem-vindo ao \nMoviEmotion!")
                    .font(.title)
                
                Spacer()
                
                Text("blablabla")
                
                Spacer()
                
                Text("Aceite os termos abaixo antes \nde prosseguir:")
                    .font(.system(size: 20))
                
                
                List($opcoes) { $opcoes in
                    HStack {
                        Image(systemName: opcoes.marcado ? "checkmark.square" : "square")
                            .onTapGesture {
                                opcoes.marcado.toggle()
                            }
                        Text(opcoes.texto)
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

#Preview {
    WelcomeView()
}
