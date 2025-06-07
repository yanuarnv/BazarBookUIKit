

import Foundation

// MARK: - Book
struct BookModel: Codable {
    let kind: String
    let totalItems: Int
    let items: [BookItem]
}

// MARK: - Item
struct BookItem: Codable {
    let id, etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let embeddable, publicDomain: Bool
    let epub, pdf: Epub
    let webReaderLink: String
    let quoteSharingAllowed: Bool
}


// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool
    let acsTokenLink: String?
}


// MARK: - SaleInfo

// MARK: - SaleInfoListPrice
struct SaleInfoListPrice: Codable {
    let amount: Int
}


// MARK: - Offer
struct Offer: Codable {
    let finskyOfferType: Int
    let listPrice, retailPrice: OfferListPrice
}

// MARK: - OfferListPrice
struct OfferListPrice: Codable {
    let amountInMicros: Int
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]?
    let publisher, publishedDate: String?
    let description: String?
    let pageCount: Int
    let categories: [String]?
    let allowAnonLogging: Bool
    let contentVersion: String
    let imageLinks: ImageLinks
    let previewLink: String
    let infoLink: String
    let canonicalVolumeLink: String
    let subtitle: String?
    let averageRating, ratingsCount: Int?
}

// MARK: - ImageLinks
struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String 
}

