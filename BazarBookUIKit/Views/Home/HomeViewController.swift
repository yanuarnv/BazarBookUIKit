import UIKit
class HomeViewController:UIViewController {
    
    
    private let carouselSlider:CarouselSlider = {
        let slider =  CarouselSlider()
        let data = [
            HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
            HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
            HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
        ]
        slider.cells = data
        slider.pageControl.numberOfPages = data.count
        return slider
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        layout()
    }
    
}
extension HomeViewController{
    func setup(){
        [carouselSlider].forEach{
            view.addSubview($0)
        }
        [carouselSlider].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    
    func layout(){
        NSLayoutConstraint.activate([
            carouselSlider.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            carouselSlider.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselSlider.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            carouselSlider.heightAnchor.constraint(equalToConstant: 230)
        ])
    }
    
}



#Preview {
    HomeViewController()
}
