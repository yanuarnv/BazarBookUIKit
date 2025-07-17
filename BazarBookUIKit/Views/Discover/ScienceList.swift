import UIKit
import SDWebImage
class ScienceList: UIView, UICollectionViewDelegate {
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
        await viewModel.getScienceBooks(maxResult: 6){error in
          
        }
        collectionView.reloadData()
    }
    
    // CollectionView Layout
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
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
        collectionView.register(ScienceCell.self, forCellWithReuseIdentifier: "ScienceCell")
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
        label.text = "Science"
        label.font = .title2
        return label
    }()
    
    private let headerSubTitle: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = .body
        return button
    }()
    
    private let colum:UIStackView = {
        let colum = UIStackView()
        colum.axis = .vertical
        colum.spacing = 8
        colum.translatesAutoresizingMaskIntoConstraints = false
        return colum
    }()
}

// MARK: - Setup Layout
extension ScienceList {
    private func setup() {
        // Add header row
        [headerTitle, headerSubTitle].forEach{
            rowList.addArrangedSubview($0)
        }
        [rowList, collectionView].forEach{
            colum.addArrangedSubview($0)
        }
        
        [headerTitle,headerSubTitle,rowList,collectionView].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addSubview(colum)
        
        NSLayoutConstraint.activate([
            colum.topAnchor.constraint(equalTo: topAnchor),
            colum.bottomAnchor.constraint(equalTo: bottomAnchor),
            colum.trailingAnchor.constraint(equalTo: trailingAnchor),
            colum.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: 250),
            
            rowList.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            headerSubTitle.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16)
        ])
    }
}

// MARK: - UICollectionView DataSource
extension ScienceList: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.scienceList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ScienceCell", for: indexPath) as? ScienceCell else {
            return UICollectionViewCell()
        }
        let item = viewModel.scienceList[indexPath.item]
        cell.title.text = item.volumeInfo.title
        if let imgLink = URL(string: item.volumeInfo.imageLinks.thumbnail){
            cell.image.sd_setImage(with: imgLink,placeholderImage: nil)
        }
        
        return cell
    }
}

extension ScienceList:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 220)
    }
}

// MARK: - Preview
#Preview {
    let list = ScienceList()
    return list
}

