import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    let id: Int  // This is the movie's unique ID from the API
    let title: String
    let original_title: String
    let release_date: String
    let poster_path: String?
    let backdrop_path: String?
    let overview: String
}
