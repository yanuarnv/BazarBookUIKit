import Foundation

let screenPadding = 16.0
// add some changes
enum Keys {
    static let apiKey: String = {
        guard let key = Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String else {
            fatalError("❌ API Key not found in Info.plist")
        }
        return key
    }()
    
    static let baseURL: String = {
        guard let url = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String else {
            fatalError("❌ Base URL not found in Info.plist")
        }
        return url
    }()
}
