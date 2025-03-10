struct TopOfWeekModel {
    var title:String
    var subtitle:String
    var image:String
}

extension TopOfWeekModel{
    static func dummy() -> [TopOfWeekModel]{
        return [
            TopOfWeekModel(title: "Title 1", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 2", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 3", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 4", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 5", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 6", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 7", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 8", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 1", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 2", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 3", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 4", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 5", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 6", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 7", subtitle: "Subtitle", image: "exampleTopWeekImg"),
            TopOfWeekModel(title: "Title 8", subtitle: "Subtitle", image: "exampleTopWeekImg"),
        ]
    }
}
