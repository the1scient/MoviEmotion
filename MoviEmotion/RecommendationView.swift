import SwiftUI

struct RecommendationView: View {
    @StateObject private var viewModel: MovieViewModel
    @State private var showSheet = false
    @State private var selectedMovie: Movie?
    @State private var userName: String = UserDefaults.standard.string(forKey: "UserName") ?? "Usuário"
    
    init(categorie: String) {
        _viewModel = StateObject(wrappedValue: MovieViewModel(categorie: "\(categorie)"))
    }

    let imageURL = "https://image.tmdb.org/t/p/original/"

    var body: some View {
        VStack {
            HStack {
                Text("Para \(userName)")
                    .font(.system(size: 25))
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leadingFirstTextBaseline)
                    .padding()
                    .padding(.horizontal, 5)
                    .lineLimit(1)
                    .truncationMode(.tail)
                    .minimumScaleFactor(0.5)
            }

            if let firstMovie = viewModel.movies.first {
                Button(action: {
                    selectedMovie = firstMovie
                    showSheet.toggle()
                }) {
                    AsyncImage(url: URL(string: imageURL + (firstMovie.poster_path ?? ""))) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(height: 400)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(maxHeight: 540)
                                .cornerRadius(20)
                        case .failure:
                            Image(systemName: "photo")
                                .resizable()
                                .scaledToFit()
                                .frame(height: 400)
                                .foregroundColor(.gray)
                                .ignoresSafeArea(edges: .top)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
                .sheet(item: $selectedMovie) { movie in
                    MovieView(movieInfo: movie)
                        .id(UUID())
                }
            }

            Spacer()
            Text("Outras recomendações:")
                .font(.system(size: 15, weight: .semibold))
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 4)
            Spacer()

            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.movies.dropFirst(), id: \.id) { movie in
                        Button(action: {
                            selectedMovie = movie
                            showSheet.toggle()
                        }) {
                            AsyncImage(url: URL(string: imageURL + (movie.poster_path ?? ""))) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: 120, height: 180)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 180)
                                        .cornerRadius(8)
                                case .failure:
                                    Image(systemName: "photo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 120, height: 180)
                                        .foregroundColor(.gray)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .onAppear {
            userName = UserDefaults.standard.string(forKey: "UserName") ?? "Usuário"
        }
    }
}

#Preview {
    RecommendationView(categorie: "37")
}
