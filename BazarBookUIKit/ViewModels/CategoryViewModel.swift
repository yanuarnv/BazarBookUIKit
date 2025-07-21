import Observation
import Foundation

class CategoryViewModel {
    private var service: BookApiService
    @Published private(set) var isLoading: Bool = false
    private(set) var categoryData:[BookItem] = []
    
    init(service:BookApiService) {
        self.service = service
    }
    func getCategoryData(query: String,maxResult: Int = 10,onError: @escaping (Error) -> Void?) async{
        do{
            isLoading = true
            let data = try await service.getBooks(name: query, maxResults: maxResult)
            switch data {
            case .success(let books):
                self.categoryData = books
                isLoading = false
            case .failure(let error):
                onError(error)
                Logger.error("getCategoryData error: \(error.localizedDescription)")
            }
        }catch{
            onError(error)
            Logger.debug("Unexpected error: \(error.localizedDescription)")
        }
    }
}
