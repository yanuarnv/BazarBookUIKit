import UIKit

class HomeViewController: UIViewController {
    private var lastContentOffset: CGFloat = 0
    private let scrollThreshold: CGFloat = 10.0
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIStackView = {
        let colum = UIStackView()
        colum.axis = .vertical
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
    
    private let accountContainer:UIStackView = {
        let container = UIStackView()
        container.axis = .horizontal
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    private let accountImage:UIButton = {
        let button = UIButton(type: .custom)
        let img = UIImage(systemName: "person.circle")
        button.setBackgroundImage(img, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let navigationTitle:UILabel = {
        let label = UILabel()
        label.text = "Discover"
        label.font = .title1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Task{
            await economicList.loadData()
            await scienceList.loadData()
            await novelsList.loadData()
        }
        view.backgroundColor = .white
        navigationItem.title = "Discover"
        setup()
        layout()
    }
    
}
extension HomeViewController:UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        if offsetY < -56 {
            navigationController?.setNavigationBarHidden(true, animated: true)
        }else{
            navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }

}

extension HomeViewController {
    
    func setup() {
        scrollView.delegate = self
        accountImage.addTarget(self, action: #selector(accountTapped), for: .touchUpInside)
        
        scrollView.addSubview(contentView)
        [navigationTitle,accountImage].forEach{
            accountContainer.addArrangedSubview($0)
        }
        
        [accountContainer,carouselSlider, economicList, scienceList, novelsList].forEach {
            contentView.addArrangedSubview($0)
        }
        view.addSubview(scrollView)
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
            
            accountContainer.heightAnchor.constraint(equalToConstant: 44),
            accountContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor,constant: 16),
            accountContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor,constant: -16),
            accountImage.widthAnchor.constraint(equalToConstant: 44),
            
        ])
    }
    
    @objc func accountTapped(for sender:UIButton){
        print("tapped")
    }
}

#Preview{
    HomeViewController()
}
