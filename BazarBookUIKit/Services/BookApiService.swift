import Foundation
protocol BookApiService {
    func getBooks(name:String,maxResults:Int) async throws -> Result<[BookItem],Error>
}

class BookApiServiceImpl:BookApiService{
    func getBooks(name:String ,maxResults:Int)async throws -> Result<[BookItem],Error>  {
        do{
            guard let url = URL(string: "\(Keys.baseURL)books/v1/volumes?q=\(name)&key=\(Keys.apiKey)&maxResults=\(maxResults)") else {
                throw NSError(domain: "MyApp", code: 2, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"])
            }
            print("GET: \(url)")
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            let (data, _) = try await URLSession.shared.data(for: request)
            
            let decode = try JSONDecoder().decode(BookModel.self, from: data)
            
            return .success(decode.items)
        }catch{
            print(error)
            return .failure(error)
        }
    }
}
