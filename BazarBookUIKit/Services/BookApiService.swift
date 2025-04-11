import Foundation
protocol BookApiService {
    func getBooks() async throws -> Result<[BookItem],Error>
}

class BookApiServiceImpl:BookApiService{
    func getBooks()async throws -> Result<[BookItem],Error>  {
        do{
            guard let url = URL(string: "\(Keys.baseURL)books/v1/volumes?q=search+terms&key=\(Keys.apiKey)") else {
                throw NSError(domain: "MyApp", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decode = try JSONDecoder().decode(BookModel.self, from: data)
            print(decode)
            return .success(decode.items)
        }catch{
            return .failure(error)
        }
    }
}
