import UIKit

class HomeViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    private let carouselSlider: CarouselSlider = {
        let slider = CarouselSlider()
        let data = [
            HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
            HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
            HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
        ]
        slider.cells = data
        slider.pageControl.numberOfPages = data.count
        return slider
    }()
    
    private let topOfWeekList: TopOfWeekList = {
        let list = TopOfWeekList()
        list.data = TopOfWeekModel.dummy()
        return list
    }()
    
    private let bestVendorsList: BestVendorsList = {
        let list = BestVendorsList()
        list.data = BestVendorsModel.dummy()
        return list
    }()
    
    private let authorList: AuthorsList = {
        let list = AuthorsList()
        list.data = AuthorModel.dummy()
        return list
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        [carouselSlider, topOfWeekList, bestVendorsList, authorList].forEach {
            contentView.addSubview($0)
        }
        
        // Aktifkan Auto Layout
        [scrollView, contentView, carouselSlider, topOfWeekList, bestVendorsList, authorList].forEach {
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
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor,constant: screenPadding),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor,constant: -screenPadding),
            
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor,constant: -32),
            
            // Carousel Slider
            carouselSlider.topAnchor.constraint(equalTo: contentView.topAnchor),
            carouselSlider.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            carouselSlider.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            carouselSlider.heightAnchor.constraint(equalToConstant: 230),
            
            // Top of Week List
            topOfWeekList.topAnchor.constraint(equalTo: carouselSlider.bottomAnchor,constant: screenPadding),
            topOfWeekList.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            topOfWeekList.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            topOfWeekList.heightAnchor.constraint(equalToConstant: 260),
            
            // Best Vendors List
            bestVendorsList.topAnchor.constraint(equalTo: topOfWeekList.bottomAnchor, constant: screenPadding),
            bestVendorsList.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            bestVendorsList.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bestVendorsList.heightAnchor.constraint(equalToConstant: 130),
            //author list
            authorList.topAnchor.constraint(equalTo: bestVendorsList.bottomAnchor, constant: screenPadding),
            authorList.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            authorList.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            authorList.heightAnchor.constraint(equalToConstant: 258),
            
            authorList.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

#Preview{
    HomeViewController()
}
