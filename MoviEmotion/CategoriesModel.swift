import Foundation

struct CategoriesResponse: Codable {
    let genres: [Categorie]
}

struct Categorie: Codable {
    let id: Int
    let name: String
}
