struct BestVendorsModel {
    var image:String
}

extension BestVendorsModel{
    static func dummy()->[BestVendorsModel]{
        return [
            BestVendorsModel(image: "bestVendorsImg"),
            BestVendorsModel(image: "bestVendorsImg"),
            BestVendorsModel(image: "bestVendorsImg"),
            BestVendorsModel(image: "bestVendorsImg"),
            BestVendorsModel(image: "bestVendorsImg"),
            BestVendorsModel(image: "bestVendorsImg"),
            BestVendorsModel(image: "bestVendorsImg"),
        ]
    }
}
