@propertyWrapper
struct Inject<Element>{
    private let element:Element
    
    init() {
        guard let resolvedService = AppContainer.shared.resolve(type: Element.self) else {
            fatalError("No service of type \(Element.self) registered!")
        }
        self.element = resolvedService
    }
    
    var wrappedValue: Element {
        return element
    }
}
