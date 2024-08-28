import Foundation
import Combine

class CategoriesViewModel: ObservableObject {
    @Published var categories: [Categorie] = []
    @Published var error: Error?

    private var cancellables = Set<AnyCancellable>()
    
    private let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyM2IyMjVkZDFhMzM1MWM2NGQ1OTI1YTcwZWI2NzA4MiIsIm5iZiI6MTcyNDQzNjc4NC44MDIzNjYsInN1YiI6IjY2YzY0YjBjYWIwYmMxOWIyMWZhM2I3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.thyFAYAYSXpCvScnpOlEaDvSIJODG35HR1U8JjGZ54c"
    private let baseURL = "https://api.themoviedb.org/3/genre/movie/list"
    
    init() {
        fetchCategories()
    }
    
    func fetchCategories() {
        guard let url = URL(string: baseURL) else {
            self.error = NSError(domain: "", code: 101, userInfo: [NSLocalizedDescriptionKey: "Failed to create URL"])
            return
        }
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "pt-BR"),
        ]
        components.queryItems = queryItems
        
        guard let finalURL = components.url else {
            self.error = NSError(domain: "", code: 102, userInfo: [NSLocalizedDescriptionKey: "Failed to create final URL"])
            return
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.error = error
                }
                print("Error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    self?.error = NSError(domain: "", code: 103, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                }
                return
            }
            
            // Debug: Print raw JSON data
            if let jsonString = String(data: data, encoding: .utf8) {
                print("Raw JSON Response: \(jsonString)")
            }
            
            do {
                let response = try JSONDecoder().decode(CategoriesResponse.self, from: data)
                DispatchQueue.main.async {
                    self?.categories = response.genres
                }
            } catch {
                DispatchQueue.main.async {
                    self?.error = error
                }
                print("Decoding error: \(error.localizedDescription)")
            }
        }.resume()
    }

}
