import Foundation
import Combine

class ClassificationViewModel: ObservableObject {
    @Published var classification: String = "N/A"
    @Published var error: Error?
    
    private var cancellables = Set<AnyCancellable>()
    private let apiKey = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyM2IyMjVkZDFhMzM1MWM2NGQ1OTI1YTcwZWI2NzA4MiIsIm5iZiI6MTcyNDI3MjU5NS41NzA4MzcsInN1YiI6IjY2YzY0YjBjYWIwYmMxOWIyMWZhM2I3YiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0D2z4sBRGHgQQa5LphKERF_540K3jDMFUentV5AP34c"
    private let baseURL = "https://api.themoviedb.org/3/movie/"
    
    init(movieId: Int) {
        fetchClassification(movieId: movieId)
    }
    
    func fetchClassification(movieId: Int) {
        guard let url = URL(string: "\(baseURL)\(movieId)/release_dates") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 100
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(apiKey)"
        ]
        
        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: ClassificationResponse.self, decoder: JSONDecoder())
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
                if let brResult = response.results.first(where: { $0.iso_3166_1 == "BR" }),
                   let brClassification = brResult.release_dates.first(where: { !$0.certification.isEmpty }) {
                    self?.classification = brClassification.certification
                } else {
                    self?.classification = "N/A"
                }
            })
            .store(in: &cancellables)
    }
}
