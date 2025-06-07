import UIKit

class BestVendorsList: UIView, UICollectionViewDelegate {
    @Inject private var viewModel: HomeViewModel
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // make sure run in main thread
    @MainActor
    func loadData()async{
        await viewModel.getBestVendorBooks(maxResult: 6){error in
          
        }
        collectionView.reloadData()
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
        collectionView.register(BestVendorsCell.self, forCellWithReuseIdentifier: "BestVendorsCell")
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
        label.text = "Best Vendors"
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
extension BestVendorsList {
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
            collectionView.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
}

// MARK: - UICollectionView DataSource
extension BestVendorsList: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.bestVendorList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestVendorsCell", for: indexPath) as? BestVendorsCell else {
            return UICollectionViewCell()
        }
        let item = viewModel.bestVendorList[indexPath.item]
        if let imgLink = URL(string: item.volumeInfo.imageLinks.thumbnail){
            cell.image.sd_setImage(with: imgLink,placeholderImage: nil)
        }
        return cell
    }
}

extension BestVendorsList:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

// MARK: - Preview
#Preview {
    let list = BestVendorsList()
    return list
}

