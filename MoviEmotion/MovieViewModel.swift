import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    private let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyM2IyMjVkZDFhMzM1MWM2NGQ1OTI1YTcwZWI2NzA4MiIsIm5iZiI6MTcyNDQzNjc4NC44MDIzNjYsInN1YiI6IjY2YzY0YjBjYWIwYmMxOWIyMWZhM2I3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.thyFAYAYSXpCvScnpOlEaDvSIJODG35HR1U8JjGZ54c"
    private let baseURL = "https://api.themoviedb.org/3/discover/movie"
    
    init(categorie: String) {
        fetchMovies(categorie: categorie)
    }
    
    func fetchMovies(categorie: String) {
        guard let url = URL(string: baseURL) else {
            return
        }
        
        let age = UserDefaults.standard.integer(forKey: "UserAge")
        let includeAdult = age >= 18 ? "true" : "false"
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "include_adult", value: includeAdult),
            URLQueryItem(name: "include_video", value: "false"),
            URLQueryItem(name: "language", value: "pt-BR"),
            URLQueryItem(name: "page", value: "1"),
            URLQueryItem(name: "sort_by", value: "vote_count.desc"),
            URLQueryItem(name: "region", value: "BR"),
            URLQueryItem(name: "with_genres", value: "\(categorie)"),
        ]
        components.queryItems = queryItems
        
        guard let finalURL = components.url else {
            self.error = NSError(domain: "", code: 101, userInfo: [NSLocalizedDescriptionKey: "Failed to create final URL"])
            return
        }
        
        var request = URLRequest(url: finalURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 100
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: MovieResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self.error = error
                    print("Error: \(error.localizedDescription)")
                    print(completion)
                }
            }, receiveValue: { [weak self] response in
                self?.movies = response.results
            })
            .store(in: &cancellables)
    }
}
