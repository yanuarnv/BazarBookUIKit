import Foundation
import Observation

@Observable
final class HomeViewModel {
    private var service: BookApiService
    private(set) var topOfWeekList: [BookItem] = []
    private(set) var bestVendorList: [BookItem] = []
    private(set) var authorList: [BookItem] = []
    
    init(service:BookApiService) {
        self.service = service
    }
    
    func getTopOfWeekBooks(maxResult: Int = 10,onError: @escaping (Error) -> Void?) async {
        do {
            let result = try await service.getBooks(name: "economic", maxResults: maxResult)
            switch result {
            case .success(let data):
                topOfWeekList = data
            case .failure(let apiError):
                onError(apiError)
                print("API Error: \(apiError.localizedDescription)")
            }
        } catch {
            onError(error)
            print("Unexpected error: \(error.localizedDescription)")
        }
    }
    
    func getBestVendorBooks(maxResult: Int = 10,onError: @escaping (Error) -> Void?) async {
        do {
            let result = try await service.getBooks(name: "a", maxResults: maxResult)
            switch result {
            case .success(let data):
                bestVendorList = data
            case .failure(let apiError):
                onError(apiError)
                print("getBestVendorBooks API Error: \(apiError.localizedDescription)")
            }
        } catch {
            onError(error)
            print("Unexpected error: \(error.localizedDescription)")
        }
    }
    
    func getAuthorBooks(maxResult: Int = 10,onError: @escaping (Error) -> Void?) async {
        do {
            let result = try await service.getBooks(name: "c", maxResults: maxResult)
            switch result {
            case .success(let data):
                authorList = data
            case .failure(let apiError):
                onError(apiError)
                print("getBestVendorBooks API Error: \(apiError.localizedDescription)")
            }
        } catch {
            onError(error)
            print("Unexpected error: \(error.localizedDescription)")
        }
    }
}
