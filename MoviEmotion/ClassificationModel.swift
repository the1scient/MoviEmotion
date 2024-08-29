import Foundation

struct ClassificationResponse: Codable {
    let results: [ClassificationResult]
}

struct ClassificationResult: Codable {
    let iso_3166_1: String
    let release_dates: [ReleaseDate]
}

struct ReleaseDate: Codable {
    let certification: String
    let type: Int
}
