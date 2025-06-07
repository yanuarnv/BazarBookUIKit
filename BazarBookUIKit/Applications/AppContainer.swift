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
       
}
