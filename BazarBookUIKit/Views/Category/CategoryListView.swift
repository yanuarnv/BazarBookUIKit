import UIKit

class CategoryListView: UIView,UICollectionViewDelegate {
    var selectedIndex: Int = 0
    @Inject private var viewModel:CategoryViewModel
    private let categoryMap:[(key: String, value: String)] = [
        ("heart.fill" , "For You"),
        ("square.grid.3x2.fill","All Titles"),
        ( "atom","Science"),
        ("newspaper","News"),
        ("music.note","Music"),
        ("photo.stack","Photography")
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // CollectionView
    private lazy var collectionView: UICollectionView = {
        let layout = createCarouselLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(CategoryListViewCell.self, forCellWithReuseIdentifier: "CategoryListViewCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
}

extension CategoryListView{
    func setup(){
        Task{
            await viewModel.getCategoryData(query: "Economic"){error in
            }
        }
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    private func createCarouselLayout() -> UICollectionViewCompositionalLayout {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.42),
            heightDimension: .absolute(45)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 16
        
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    @objc func doSomething(sender: UIButton){
        let index = sender.tag
        let previousIndex = selectedIndex
        selectedIndex = index
        collectionView.reloadItems(at: [IndexPath(item: previousIndex, section: 0),
                                        IndexPath(item: selectedIndex, section: 0)])
        Task{
            await viewModel.getCategoryData(query: "\(sender.titleLabel?.text ?? "")"){error in
            }
        }
    }
}

// MARK: - UICollectionView DataSource
extension CategoryListView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryMap.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryListViewCell", for: indexPath) as? CategoryListViewCell else {
            return UICollectionViewCell()
        }
        let item = categoryMap[indexPath.item]
        cell.button.tag = indexPath.item
        cell.button.addTarget(self, action: #selector(doSomething(sender:)), for: .touchUpInside)
        cell.button.setTitle("   "+item.value, for: .normal)
        cell.button.setImage(UIImage(systemName: item.key), for: .normal)
        if selectedIndex == indexPath.item{
            cell.button.backgroundColor = .primary
            cell.button.tintColor = .white
        }else{
            cell.button.backgroundColor = .systemGray6
            cell.button.tintColor = .textPrimary
        }
        return cell
    }
}

extension CategoryListView:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 44)
    }
}

#Preview{
    CategoryListView()
}


class CategoryListViewCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 44),
            button.widthAnchor.constraint(equalToConstant: 120),
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let button:UIButton = {
        let btn = UIButton(type: .system)
        btn.tintColor = .black
        btn.backgroundColor = .systemGray6
        btn.setTitle("Favorite", for: .normal)
        btn.titleLabel?.font = .boldSystemFont(ofSize: 17)
        btn.layer.cornerRadius = 8
        btn.layer.masksToBounds = true
        btn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
}

#Preview{
    PreviewHelper.categoryViewController()
}
