import UIKit
class CarouselSlider:UIView{
    
    var cells:[HomeBannerModel] = []{
        didSet{
            carouselSlider.reloadData()
            pageControl.numberOfPages = cells.count
        }
    }
    
    private var currentIndex: Int = 0 {
        didSet{
            pageControl.currentPage = currentIndex
        }
    }
    
    private lazy var carouselSlider: UICollectionView = {
        let layout = createCarouselLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.dataSource = self
        collectionView.register(CarouselSliderCell.self, forCellWithReuseIdentifier: "CarouselSliderCell")
        return collectionView
    }()
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray.withAlphaComponent(0.5)
        pageControl.currentPageIndicatorTintColor = .primary
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()
    
    private var layout:UIStackView = {
        let colum = UIStackView()
        colum.axis = .vertical
        colum.spacing = 8
        colum.translatesAutoresizingMaskIntoConstraints = false
        return colum
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        [carouselSlider,pageControl].forEach{
            layout.addArrangedSubview($0)
        }
        addSubview(layout)
        //layout
        NSLayoutConstraint.activate([
            carouselSlider.heightAnchor.constraint(equalToConstant: 200),
            pageControl.widthAnchor.constraint(equalToConstant: 100),
            layout.topAnchor.constraint(equalTo: topAnchor),
            layout.bottomAnchor.constraint(equalTo: bottomAnchor),
            layout.trailingAnchor.constraint(equalTo: trailingAnchor),
            layout.leadingAnchor.constraint(equalTo: leadingAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func createCarouselLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.91),
            heightDimension: .absolute(200)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.interGroupSpacing = 8
        
        //listen scroll
        section.visibleItemsInvalidationHandler = { [weak self] (visibleItems, offset, environment) in
            guard let self = self else { return }
            let center = offset.x + environment.container.contentSize.width / 2
            if let index = visibleItems.min(by: {
                abs($0.frame.midX - center) < abs($1.frame.midX - center)
            })?.indexPath.item {
                if self.currentIndex != index {
                    self.currentIndex = index
                }
            }
        }
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
}

extension CarouselSlider:UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselSliderCell", for: indexPath) as? CarouselSliderCell else {return UICollectionViewCell()}
        cell.subTitle.text = cells[indexPath.item].subTitle
        cell.title.text = cells[indexPath.item].title
        return cell
    }
}



#Preview{
    let slider = CarouselSlider()
    let data = [
        HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
        HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
        HomeBannerModel(title: "title", subTitle: "subTitle", imageName: "example_banner"),
    ]
    slider.cells = data
    slider.pageControl.numberOfPages = data.count
    return slider
}
