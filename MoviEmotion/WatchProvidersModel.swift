import Foundation

struct WatchProvidersResponse: Codable {
    let results: [String: WatchProviderResult]
}

struct WatchProviderResult: Codable {
    let link: String
    let flatrate: [Provider]?
    let rent: [Provider]?
    let buy: [Provider]?
}

struct Provider: Codable {
    let provider_name: String
    let provider_id: Int
    let logo_path: String?
}
