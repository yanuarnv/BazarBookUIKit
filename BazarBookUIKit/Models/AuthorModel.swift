struct AuthorModel {
    var name:String
    var job:String
    var image:String
}

extension AuthorModel{
    static func dummy()->[AuthorModel]{
        return [
            AuthorModel(name: "John Doe", job: "Software Engineer",image: "exampleTopWeekImg"),
            AuthorModel(name: "Jane Doe", job: "Software Engineer",image: "exampleTopWeekImg"),
            AuthorModel(name: "John Smith", job: "Software Engineer",image: "exampleTopWeekImg"),
            AuthorModel(name: "John Smith", job: "Software Engineer",image: "exampleTopWeekImg"),
            AuthorModel(name: "John Smith", job: "Software Engineer",image: "exampleTopWeekImg"),
            AuthorModel(name: "John Smith", job: "Software Engineer",image: "exampleTopWeekImg"),
        ]
    }
}
