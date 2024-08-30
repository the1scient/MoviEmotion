import SwiftUI

struct MovieView: View {
    @Environment(\.dismiss) var dismiss  // To dismiss the sheet
    @State var movieInfo: Movie
    @StateObject private var classificationViewModel: ClassificationViewModel
    @StateObject private var watchProvidersViewModel: WatchProvidersViewModel

    let imageURL = "https://image.tmdb.org/t/p/original/"

    init(movieInfo: Movie) {
        _movieInfo = State(wrappedValue: movieInfo)
        _classificationViewModel = StateObject(wrappedValue: ClassificationViewModel(movieId: movieInfo.id))
        _watchProvidersViewModel = StateObject(wrappedValue: WatchProvidersViewModel(movieId: movieInfo.id))
    }
    
    private var classificationURL: String {
        switch classificationViewModel.classification.lowercased() {
        case "l":
            return "https://www.gov.br/mj/pt-br/assuntos/seus-direitos/classificacao-1/simbolos-de-autoclassificacao/l-auto.png/@@images/image"
        case "10":
            return "https://www.gov.br/mj/pt-br/assuntos/seus-direitos/classificacao-1/simbolos-de-autoclassificacao/nr10-auto.png/@@images/image"
        case "12":
            return "https://www.gov.br/mj/pt-br/assuntos/seus-direitos/classificacao-1/simbolos-de-autoclassificacao/nr12-auto.png/@@images/image"
        case "14":
            return "https://www.gov.br/mj/pt-br/assuntos/seus-direitos/classificacao-1/simbolos-de-autoclassificacao/nr14-auto.png/@@images/image"
        case "16":
            return "https://www.gov.br/mj/pt-br/assuntos/seus-direitos/classificacao-1/simbolos-de-autoclassificacao/nr16-auto.png/@@images/image"
        case "18":
            return "https://www.gov.br/mj/pt-br/assuntos/seus-direitos/classificacao-1/simbolos-de-autoclassificacao/nr18-auto.png/@@images/image"
        default:
            return "https://www.gov.br/mj/pt-br/assuntos/seus-direitos/classificacao-1/simbolos-de-autoclassificacao/l-auto.png/@@images/image"
        }
    }
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
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
                    AsyncImage(url: URL(string: "\(classificationURL)")) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 66, height: 66)
                        case .success(let image):
                            image
                                .resizable()
                                .frame(width: 66, height: 66)
                                .cornerRadius(5)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 66, height: 66)
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
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
                        
                        if let providers = watchProvidersViewModel.watchProviders {
                            ScrollView(.horizontal) {
                                HStack(alignment: .center) {
                                    ForEach(providers.flatrate ?? [], id: \.provider_id) { provider in
                                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original/\(provider.logo_path ?? "")")) { phase in
                                            switch phase {
                                            case .empty:
                                                ProgressView()
                                                    .frame(width: 40, height: 40)
                                            case .success(let image):
                                                image
                                                    .resizable()
                                                    .frame(width: 60, height: 60)
                                                    .cornerRadius(5)
                                                    .padding(.horizontal, 10)
                                            case .failure:
                                                Image(systemName: "photo")
                                                    .resizable()
                                                    .scaledToFit()
                                                    .frame(width: 40, height: 40)
                                                    .foregroundColor(.gray)
                                            @unknown default:
                                                EmptyView()
                                            }
                                        }
                                    }
                                }
                            }
                        } else if let error = watchProvidersViewModel.error {
                            Text("Erro ao carregar provedores: \(error.localizedDescription)")
                                .foregroundColor(.red).font(.headline)
                        } else {
                            Text("Este filme não possue provedores de streaming atualmente.").foregroundColor(.white).font(.headline)
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
            .background(Color.black)
            
            Button(action: {
                dismiss()
            }) {
                Text("OK").foregroundColor(.white).padding(.trailing, 20).padding(.top, 15)
            }
        }
    }

    private func getYear(from dateString: String) -> String {
        let components = dateString.split(separator: "-")
        return components.first.map(String.init) ?? ""
    }
}

#Preview {
    MovieView(movieInfo: Movie(
        id: 68718,  // Example movie ID from TMDb
        title: "DivertidaMente 2",
        original_title: "Inside Out 2",
        release_date: "2024-06-14",
        poster_path: "/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
        backdrop_path: "/3q01ACG0MWm0DekhvkPFCXyPZSu.jpg",
        overview: "Divertida Mente 2, da Disney e da Pixar, retorna à mente da adolescente Riley, e o faz no momento em que a sala de comando está passando por uma demolição repentina para dar lugar a algo totalmente inesperado: novas emoções! Alegria, Tristeza, Raiva, Medo e Nojinho não sabem bem como reagir quando Ansiedade aparece, e tudo indica que ela não está sozinha"
    ))
}
