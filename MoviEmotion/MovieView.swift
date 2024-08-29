import SwiftUI

struct MovieView: View {
    @State var movieInfo: Movie
    let imageURL = "https://image.tmdb.org/t/p/original/"

    var body: some View {

            ZStack {
                ScrollView {
                GeometryReader { geometry in
                    // Imagem de Fundo no Topo
                    AsyncImage(url: URL(string: imageURL + (movieInfo.backdrop_path ?? ""))) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: geometry.size.width, minHeight: 460)
                                .overlay(Color.black.opacity(0.7)) // Sobreposição escura
                                .ignoresSafeArea()
                        case .failure:
                            Color.black.opacity(0.5)
                                .ignoresSafeArea()
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                
                VStack {
                    Spacer().frame(height: 50) // Espaçamento superior
                    
                    // Poster Principal
                    AsyncImage(url: URL(string: imageURL + (movieInfo.poster_path ?? ""))) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 180, height: 270)
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 270)
                                .cornerRadius(8)
                                .shadow(radius: 10)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 180, height: 270)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    // Título do Filme - Centralizado
                    Text("\(movieInfo.title) (\(getYear(from: movieInfo.release_date)))")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                        .multilineTextAlignment(.center)
                    
                    // Imagem - Centralizada
                    AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1619431843897-4676bff0c286?q=80&w=3870&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")){
                        image in
                        image.image?.resizable()
                            .frame(width: 66, height: 66)
                            .cornerRadius(5)
                    }
                    .padding(.bottom)
                    
                    VStack(alignment: .leading) {
                        Text("Sobre o filme:")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text(movieInfo.overview)
                            .foregroundColor(.white)
                            .padding(.bottom)
                        
                        Text("Onde Assistir:")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .background(Color.black)
        }
    }

    private func getYear(from dateString: String) -> String {
        let components = dateString.split(separator: "-")
        return components.first.map(String.init) ?? ""
    }

}

#Preview {
    MovieView(movieInfo: Movie(
        title: "DivertidaMente 2",
        original_title: "Inside Out 2",
        release_date: "2024-06-14",
        poster_path: "/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
        backdrop_path: "/3q01ACG0MWm0DekhvkPFCXyPZSu.jpg",
        overview: "Divertida Mente 2, da Disney e da Pixar, retorna à mente da adolescente Riley, e o faz no momento em que a sala de comando está passando por uma demolição repentina para dar lugar a algo totalmente inesperado: novas emoções! Alegria, Tristeza, Raiva, Medo e Nojinho não sabem bem como reagir quando Ansiedade aparece, e tudo indica que ela não está sozinha"
    ))
}
