import SwiftUI

struct MovieView: View {
@State var movieInfo: Movie
let imageURL = "https://image.tmdb.org/t/p/original/"

var body: some View {
    ZStack {
        // Background Image
        AsyncImage(url: URL(string: imageURL + (movieInfo.backdrop_path ?? ""))) { phase in
            switch phase {
            case .empty:
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
            case .failure:
                Color.black.opacity(0.5) // Fallback background color
            @unknown default:
                EmptyView()
            }
        }
        .blur(radius: 20)

        VStack {
            Spacer().frame(height: 20) // To adjust top margin

            // Close Button
            HStack {
                Spacer()
                Button(action: {
                    // Add close button action
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                }
            }

            // Main Poster Image
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

            // Movie Title
            Text("\(movieInfo.title) (\(getYear(from: movieInfo.release_date)))")
                .font(.headline)
                .padding(.top, 10)

            // Age Rating
            Image(systemName: "L.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.green)

            // Watch Button
            Button(action: {
                // Action to watch the movie
            }) {
                Text("Assistir")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)

            // Movie Description
            Text(movieInfo.title)
                .font(.subheadline)
                .foregroundColor(.white)
                .padding()
                .background(Color.black.opacity(0.6))
                .cornerRadius(8)
                .padding(.horizontal)

            Spacer()
        }
        .padding()
    }
}

private func getYear(from dateString: String) -> String {
    let components = dateString.split(separator: "-")
    return components.first.map(String.init) ?? ""
}
}

#Preview {
MovieView(movieInfo: Movie(
title: "Divertida Mente 2",
original_title: "Inside Out 2",
release_date: "2024-06-14",
poster_path: "/iADOJ8Zymht2JPMoy3R7xceZprc.jpg",
backdrop_path: "/3q01ACG0MWm0DekhvkPFCXyPZSu.jpg"
))
}
