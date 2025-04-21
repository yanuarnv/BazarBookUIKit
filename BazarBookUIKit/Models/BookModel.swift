

import Foundation

// MARK: - Book
struct BookModel: Codable {
    let kind: String
    let totalItems: Int
    let items: [BookItem]
}

// MARK: - Item
struct BookItem: Codable {
    let kind: Kind
    let id, etag: String
    let selfLink: String
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
    let searchInfo: SearchInfo
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country: Country
    let viewability: Viewability
    let embeddable, publicDomain: Bool
    let textToSpeechPermission: TextToSpeechPermission
    let epub, pdf: Epub
    let webReaderLink: String
    let accessViewStatus: AccessViewStatus
    let quoteSharingAllowed: Bool
}

enum AccessViewStatus: String, Codable {
    case sample = "SAMPLE"
}

enum Country: String, Codable {
    case id = "ID"
}

// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool
    let acsTokenLink: String?
}

enum TextToSpeechPermission: String, Codable {
    case allowed = "ALLOWED"
}

enum Viewability: String, Codable {
    case partial = "PARTIAL"
}

enum Kind: String, Codable {
    case booksVolume = "books#volume"
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country: Country
    let saleability: Saleability
    let isEbook: Bool
    let listPrice, retailPrice: SaleInfoListPrice?
    let buyLink: String?
    let offers: [Offer]?
}

// MARK: - SaleInfoListPrice
struct SaleInfoListPrice: Codable {
    let amount: Int
    let currencyCode: CurrencyCode
}

enum CurrencyCode: String, Codable {
    case idr = "IDR"
}

// MARK: - Offer
struct Offer: Codable {
    let finskyOfferType: Int
    let listPrice, retailPrice: OfferListPrice
}

// MARK: - OfferListPrice
struct OfferListPrice: Codable {
    let amountInMicros: Int
    let currencyCode: CurrencyCode
}

enum Saleability: String, Codable {
    case forSale = "FOR_SALE"
    case notForSale = "NOT_FOR_SALE"
}

// MARK: - SearchInfo
struct SearchInfo: Codable {
    let textSnippet: String
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title: String
    let authors: [String]
    let publisher, publishedDate: String
    let description: String?
    let industryIdentifiers: [IndustryIdentifier]
    let readingModes: ReadingModes
    let pageCount: Int
    let printType: PrintType
    let categories: [String]
    let maturityRating: MaturityRating
    let allowAnonLogging: Bool
    let contentVersion: String
    let panelizationSummary: PanelizationSummary
    let imageLinks: ImageLinks
    let language: Language
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

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type: TypeEnum
    let identifier: String
}

enum TypeEnum: String, Codable {
    case isbn10 = "ISBN_10"
    case isbn13 = "ISBN_13"
}

enum Language: String, Codable {
    case en = "en"
}

enum MaturityRating: String, Codable {
    case notMature = "NOT_MATURE"
}

// MARK: - PanelizationSummary
struct PanelizationSummary: Codable {
    let containsEpubBubbles, containsImageBubbles: Bool
}

enum PrintType: String, Codable {
    case book = "BOOK"
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool
}

extension BookModel {
    static func dummy() -> [BookItem] {
        var list = [
            BookItem(
                kind: .booksVolume,
                id: "dummyID",
                etag: "etag123",
                selfLink: "https://www.googleapis.com/books/v1/volumes/dummyID",
                volumeInfo: VolumeInfo(
                    title: "Swift Programming for Beginners",
                    authors: ["John Appleseed"],
                    publisher: "Apple Press",
                    publishedDate: "2023-01-01",
                    description: "A comprehensive guide to learning Swift programming.",
                    industryIdentifiers: [
                        IndustryIdentifier(type: .isbn10, identifier: "1234567890"),
                        IndustryIdentifier(type: .isbn13, identifier: "9781234567897")
                    ],
                    readingModes: ReadingModes(text: true, image: false),
                    pageCount: 350,
                    printType: .book,
                    categories: ["Programming", "iOS Development"],
                    maturityRating: .notMature,
                    allowAnonLogging: true,
                    contentVersion: "1.0.0.0",
                    panelizationSummary: PanelizationSummary(containsEpubBubbles: false, containsImageBubbles: false),
                    imageLinks: ImageLinks(
                        smallThumbnail: "https://via.placeholder.com/128x196.png?text=Small+Thumbnail",
                        thumbnail: "https://images.unsplash.com/photo-1587691592099-24045742c181?q=80&w=2946&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
                    ),
                    language: .en,
                    previewLink: "https://books.google.com/previewlink",
                    infoLink: "https://books.google.com/infolink",
                    canonicalVolumeLink: "https://books.google.com/canonicalvolumelink",
                    subtitle: "A Beginner's Guide",
                    averageRating: 4,
                    ratingsCount: 120
                ),
                saleInfo: SaleInfo(
                    country: .id,
                    saleability: .forSale,
                    isEbook: true,
                    listPrice: SaleInfoListPrice(amount: 100000, currencyCode: .idr),
                    retailPrice: SaleInfoListPrice(amount: 85000, currencyCode: .idr),
                    buyLink: "https://books.google.com/buylink",
                    offers: [
                        Offer(
                            finskyOfferType: 1,
                            listPrice: OfferListPrice(amountInMicros: 100000000, currencyCode: .idr),
                            retailPrice: OfferListPrice(amountInMicros: 85000000, currencyCode: .idr)
                        )
                    ]
                ),
                accessInfo: AccessInfo(
                    country: .id,
                    viewability: .partial,
                    embeddable: true,
                    publicDomain: false,
                    textToSpeechPermission: .allowed,
                    epub: Epub(isAvailable: true, acsTokenLink: nil),
                    pdf: Epub(isAvailable: false, acsTokenLink: nil),
                    webReaderLink: "https://books.google.com/webreaderlink",
                    accessViewStatus: .sample,
                    quoteSharingAllowed: true
                ),
                searchInfo: SearchInfo(
                    textSnippet: "Learn the basics of Swift programming in this beginner-friendly book."
                )
            )
        ]
        
        return list
    }
}
