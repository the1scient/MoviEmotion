import SwiftUI

struct MovieView: View {
    @State var movieInfo : Movie
    let imageURL = "https://image.tmdb.org/t/p/original/"

    var body: some View {
        ZStack {
            
            AsyncImage(url: URL(string: imageURL + (movieInfo.poster_path ?? ""))) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                        .frame(width: 120, height: 180)
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
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
    }
}

#Preview {
    MovieView(movieInfo: Movie(title: "Bad Boys", original_title: "Bad Boys", release_date: "Bad Boys", poster_path: "/iADOJ8Zymht2JPMoy3R7xceZprc.jpg", backdrop_path: "/3q01ACG0MWm0DekhvkPFCXyPZSu.jpg"))
}
