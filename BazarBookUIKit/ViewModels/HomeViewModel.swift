import Foundation
import Observation

@Observable
final class HomeViewModel {
    private var service: BookApiService
    private(set) var economicList: [BookItem] = []
    private(set) var scienceList: [BookItem] = []
    private(set) var novelsList: [BookItem] = []
    
    init(service:BookApiService) {
        self.service = service
    }
    
    func getEconomicBooks(maxResult: Int = 10,onError: @escaping (Error) -> Void?) async {
        do {
            let result = try await service.getBooks(name: "Economic", maxResults: maxResult)
            switch result {
            case .success(let data):
                economicList = data
            case .failure(let apiError):
                onError(apiError)
                print("API Error: \(apiError.localizedDescription)")
            }
        } catch {
            onError(error)
            print("Unexpected error: \(error.localizedDescription)")
        }
    }
    
    func getScienceBooks(maxResult: Int = 10,onError: @escaping (Error) -> Void?) async {
        do {
            let result = try await service.getBooks(name: "Science", maxResults: maxResult)
            switch result {
            case .success(let data):
                scienceList = data
            case .failure(let apiError):
                onError(apiError)
                print("getBestVendorBooks API Error: \(apiError.localizedDescription)")
            }
        } catch {
            onError(error)
            print("Unexpected error: \(error.localizedDescription)")
        }
    }
    
    func getNovelBooks(maxResult: Int = 10,onError: @escaping (Error) -> Void?) async {
        do {
            let result = try await service.getBooks(name: "Novel", maxResults: maxResult)
            switch result {
            case .success(let data):
                novelsList = data
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
