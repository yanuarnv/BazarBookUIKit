import UIKit
import SDWebImage
class TopOfWeekList: UIView, UICollectionViewDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var data: [BookItem] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    // CollectionView Layout
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    // CollectionView
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(TopOfWeekCell.self, forCellWithReuseIdentifier: "TopOfWeekCell")
        return collectionView
    }()
    
    private let rowList: UIStackView = {
        let row = UIStackView()
        row.axis = .horizontal
        row.distribution = .equalSpacing
        return row
    }()
    
    private let headerTitle: UILabel = {
        let label = UILabel()
        label.text = "Top of Week"
        label.font = .title2
        return label
    }()
    
    private let headerSubTitle: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = .body
        return button
    }()
}

// MARK: - Setup Layout
extension TopOfWeekList {
    private func setup() {
        // Add header row
        [headerTitle, headerSubTitle].forEach{
            rowList.addArrangedSubview($0)
        }
        [rowList, collectionView].forEach{
            addSubview($0)
        }
        
        [headerTitle,headerSubTitle,rowList,collectionView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
        NSLayoutConstraint.activate([
            rowList.topAnchor.constraint(equalTo: topAnchor),
            rowList.leadingAnchor.constraint(equalTo: leadingAnchor),
            rowList.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: rowList.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 238)
        ])
    }
}

// MARK: - UICollectionView DataSource
extension TopOfWeekList: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopOfWeekCell", for: indexPath) as? TopOfWeekCell else {
            return UICollectionViewCell()
        }
        let item = data[indexPath.item]
        cell.title.text = item.volumeInfo.title
        cell.subTitle.text = item.volumeInfo.description
        if let imgLink = URL(string: item.volumeInfo.imageLinks.thumbnail){
            cell.image.sd_setImage(with: imgLink,placeholderImage: UIImage(named: "loading_placeholder"))
        }
        

        return cell
    }
}

extension TopOfWeekList:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 160)
    }
}

// MARK: - Preview
#Preview {
    let list = TopOfWeekList()
    list.data = BookModel.dummy()
    return list
}

