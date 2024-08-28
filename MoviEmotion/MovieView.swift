import SwiftUI

struct MovieView: View {
    @State var movieInfo : Movie
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    MovieView(movieInfo: Movie(title: "Bad Boys", original_title: "Bad Boys", release_date: "Bad Boys", poster_path: "Bad Boys", backdrop_path: "Bad Boys"))
}
