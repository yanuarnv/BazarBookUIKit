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
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CarouselSliderCell.self, forCellWithReuseIdentifier: "CarouselSliderCell")
        return collectionView
    }()
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.pageIndicatorTintColor = .gray
        pageControl.currentPageIndicatorTintColor = .primary
        return pageControl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(carouselSlider)
        addSubview(pageControl)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        carouselSlider.translatesAutoresizingMaskIntoConstraints = false
        //layout
        NSLayoutConstraint.activate([
            carouselSlider.topAnchor.constraint(equalTo: topAnchor),
            carouselSlider.leadingAnchor.constraint(equalTo: leadingAnchor),
            carouselSlider.trailingAnchor.constraint(equalTo: trailingAnchor),
            carouselSlider.heightAnchor.constraint(equalToConstant: 200),
            
            pageControl.topAnchor.constraint(equalTo: carouselSlider.bottomAnchor,constant: 8),
            pageControl.centerXAnchor.constraint(equalTo: carouselSlider.centerXAnchor),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
}

extension CarouselSlider:UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CarouselSliderCell", for: indexPath) as? CarouselSliderCell else {return UICollectionViewCell()}
        cell.subTitle.text = "subtitle"
        cell.title.text = "title"
        return cell
    }
}

extension CarouselSlider :UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.bounds.size
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = Int(scrollView.contentOffset.x / scrollView.frame.width)
        self.currentIndex = page
        print("Current page: \(currentIndex)")
    }
}

#Preview{
    CarouselSlider()
}
