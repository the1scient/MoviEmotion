//
//  PrivacyMenu.swift
//  MoviEmotion
//
//  Created by MARIA MERCEDES DA SILVA RODRIGUES on 30/08/24.
//

import SwiftUI

struct PrivacyMenu: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text("Política de Privacidade do MoviEmotion")
                    .font(.title)
                Spacer()
                    .frame(height: 30)

                Text("Sua privacidade é importante para nós. Esta Política de Privacidade explica como coletamos, usamos e protegemos suas informações pessoais ao utilizar o aplicativo MoviEmotion.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("1. Informações Coletadas")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Coletamos as seguintes informações:\n\nNome do Usuário: Para personalizar recomendações.\n\nData de Nascimento: Para filtrar conteúdo +18.\n\nDados de Local Storage: Para melhorar a experiência do usuário.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("2. Compartilhamento de Informações")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Não compartilhamos suas informações pessoais com terceiros, exceto quando necessário para cumprir com as leis aplicáveis ou para proteger os nossos direitos.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("3. Dados da API TMDB")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Utilizamos a API TMDB para obter dados e imagens de filmes. A TMDB coleta e processa dados conforme sua própria política de privacidade. Não temos controle sobre as práticas de privacidade da TMDB e não somos responsáveis por elas.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("4. Alterações na Política de Privacidade")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Podemos atualizar esta Política de Privacidade periodicamente. Notificaremos você sobre quaisquer alterações significativas e seu uso contínuo do aplicativo após essas alterações constitui sua aceitação da nova política.")
                    .font(.system(size: 15))
            }
                .padding(30)
        }
    }
}

#Preview {
    PrivacyMenu()
}
