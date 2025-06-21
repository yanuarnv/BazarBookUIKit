import UIKit

class HomeViewController: UIViewController {
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIStackView = {
        let colum = UIStackView()
        colum.axis = .vertical
        colum.alignment = .fill
        colum.distribution = .equalSpacing
        colum.spacing = 16
        return colum
    }()
    
    private let carouselSlider: CarouselSlider = {
        let slider = CarouselSlider()
        let data = [
            HomeBannerModel(title: "The Burning Maze", subTitle: "LA Times BestsellerPetaluma’s", imageName: "example_banner"),
            HomeBannerModel(title: "The Burning Maze", subTitle: "LA Times BestsellerPetaluma’s", imageName: "example_banner"),
            HomeBannerModel(title: "The Burning Maze", subTitle: "subLA Times BestsellerPetaluma’sTitle", imageName: "example_banner"),
            HomeBannerModel(title: "The Burning Maze", subTitle: "LA Times BestsellerPetaluma’s", imageName: "example_banner"),
            HomeBannerModel(title: "The Burning Maze", subTitle: "LA Times BestsellerPetaluma’s", imageName: "example_banner"),
            HomeBannerModel(title: "The Burning Maze", subTitle: "LA Times BestsellerPetaluma’s", imageName: "example_banner"),
        ]
        slider.cells = data
        slider.pageControl.numberOfPages = data.count
        return slider
    }()
    
    private let economicList: EconomicList = {
        let list = EconomicList()
        return list
    }()
    
    private let scienceList: ScienceList = {
        let list = ScienceList()
        return list
    }()
    
    private let novelsList: NovelsList = {
        let list = NovelsList()
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            await economicList.loadData()
            await scienceList.loadData()
            await novelsList.loadData()
        }
        view.backgroundColor = .white
        self.title = "Home"
        setup()
        layout()
    }
    
}

extension HomeViewController {
    
    func setup() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [carouselSlider, economicList, scienceList, novelsList].forEach {
            contentView.addArrangedSubview($0)
        }
        
        // Aktifkan Auto Layout
        [scrollView, contentView, carouselSlider, economicList, scienceList, novelsList].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            // UIScrollView
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // ContentView
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            
            
            
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
        ])
    }
}

#Preview{
    HomeViewController()
}
