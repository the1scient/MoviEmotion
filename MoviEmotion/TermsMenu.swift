//
//  TermsMenu.swift
//  MoviEmotion
//
//  Created by MARIA MERCEDES DA SILVA RODRIGUES on 30/08/24.
//

import SwiftUI

struct TermsMenu: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading) {
                Text("Termos de Uso do MoviEmotion")
                    .font(.title)
                Spacer()
                    .frame(height: 30)
                
                Text("1. Aceitação dos Termos")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Ao utilizar o aplicativo MoviEmotion, você concorda em cumprir e estar vinculado a estes Termos de Uso. Se você não concordar com algum desses termos, não poderá utilizar o aplicativo.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("2. Descrição do Serviço")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("MoviEmotion é um aplicativo que recomenda filmes com base na emoção que o usuário deseja sentir ou está sentindo. Utilizamos seu nome e data de nascimento para personalizar as recomendações e garantir que conteúdos classificados como +18 sejam filtrados adequadamente.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("3. Dados Coletados")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Para fornecer uma experiência personalizada, coletamos:\n\nNome do usuário\nData de nascimento\nDados de localização armazenados localmente")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("4. Uso de Dados")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Os dados coletados são utilizados para:\n\nFiltrar filmes com base na idade do usuário\n\nPersonalizar a experiência do usuário")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("5. Restrição de Uso")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Você concorda em não copiar, reproduzir, distribuir, ou utilizar qualquer dado, imagem, ou outro material fornecido pelo aplicativo para fins pessoais ou comerciais.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("6. Propriedade Intelectual")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("O MoviEmotion utiliza a API TMDB para obter dados e imagens de filmes. O uso da API está sujeito aos termos e condições da TMDB, e o MoviEmotion não é responsável por quaisquer alterações nas políticas ou serviços da TMDB.\n\nTodos os direitos de propriedade intelectual relacionados ao aplicativo MoviEmotion, incluindo imagens e dados de filmes fornecidos através da API TMDB, pertencem aos respectivos proprietários e são protegidos pelas leis de direitos autorais e outras leis de propriedade intelectual.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("8. Atribuição da Fonte de Dados")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Para usar os dados fornecidos pelo MoviEmotion, você deve atribuir a fonte dos dados como JustWatch. Se encontrarmos qualquer uso que não esteja em conformidade com estes termos, reservamo-nos o direito de revogar o acesso à API.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("9. Modificações")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("Podemos alterar estes Termos de Uso a qualquer momento. Notificaremos você sobre quaisquer alterações significativas e seu uso contínuo do aplicativo após essas alterações constitui sua aceitação dos novos termos.")
                    .font(.system(size: 15))
                
                Spacer().frame(height: 25)
                
                Text("10. Limitação de Responsabilidade")
                    .bold()
                
                Spacer()
                    .frame(height: 10)
                
                Text("O MoviEmotion não se responsabiliza por quaisquer danos diretos, indiretos, acidentais ou consequenciais resultantes do uso do aplicativo.")
                    .font(.system(size: 15))
            }
            .padding(30)
        }
    }
}

#Preview {
    TermsMenu()
}
