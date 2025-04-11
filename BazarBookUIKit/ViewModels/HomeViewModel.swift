import Foundation
@Observable
class HomeViewModel{
    var service:BookApiService
    var books: [BookItem] = []
    
    init(service: BookApiService) {
        self.service = service
    }
    func getBooks()async throws {
        let result = try await service.getBooks()
        switch result{
        case .success(let data):
            books = data
        case .failure(let error):
            print(error)
        }
    }
}


