import UIKit

// MARK: - SearchListView
class SearchListView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        // LIST LAYOUT - single column
//        layout.minimumInteritemSpacing = 0
//        layout.minimumLineSpacing = 8
//        layout.sectionInset = UIEdgeInsets(top: 16, left: 0, bottom: 16, right: 0)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .systemBackground
        collectionView.register(SearchCell.self, forCellWithReuseIdentifier: "SearchCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()
    
    func setup() {
        backgroundColor = .systemBackground
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

// MARK: - UICollectionViewDataSource
extension SearchListView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Return actual data count or show placeholder items
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCell", for: indexPath) as? SearchCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(with: nil, isLoading: false)
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension SearchListView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                       layout collectionViewLayout: UICollectionViewLayout,
                       sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.bounds.width
        let height: CGFloat = 140
        
        return CGSize(width: width, height: height)
    }
}

#Preview {
    let searchView = SearchListView()
    return searchView
}
