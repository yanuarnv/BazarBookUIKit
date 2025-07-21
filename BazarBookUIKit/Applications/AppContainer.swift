/**
 create Dependency Injection using generic type called "Element" to Allow register and resolve type
 */

protocol AppContainerProtocol{
    func register<Element>(type: Element.Type, component: Any)
    func resolve<Element>(type: Element.Type) -> Element?
}

class AppContainer:AppContainerProtocol{
    static let shared = AppContainer()
    private var containers: [String: Any] = [:]
    
    func register<Element>(type: Element.Type, component: Any) {
        containers["\(type)"] = component
    }
    
    func resolve<Element>(type: Element.Type) -> Element? {
        containers["\(type)"] as? Element
    }
    
    func reset() {
        containers.removeAll()
    }
}

extension AppContainer{
    static func configuredDependencyInjection() {
        shared.register(type: BookApiService.self, component: BookApiServiceImpl())
        shared.register(type: HomeViewModel.self, component: HomeViewModel(service: AppContainer.shared.resolve(type: BookApiService.self)!))
        shared.register(type: CategoryViewModel.self, component: CategoryViewModel(service: AppContainer.shared.resolve(type: BookApiService.self)!))
    }
}
