import UIKit

class AuthorsList: UIView, UICollectionViewDelegate {
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
        await viewModel.getAuthorBooks(maxResult: 6){error in
          
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
        collectionView.register(AuthorsCell.self, forCellWithReuseIdentifier: "AuthorsCell")
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
        label.text = "Authors"
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
extension AuthorsList {
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
extension AuthorsList: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.authorList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AuthorsCell", for: indexPath) as? AuthorsCell else {
            return UICollectionViewCell()
        }
        let item = viewModel.authorList[indexPath.item]
        if let author = item.volumeInfo.authors{
            cell.title.text = author.first
        }else{
            cell.title.text = "No Name"
        }
        
        cell.subTitle.text = item.volumeInfo.title
        if let imgLink = URL(string: item.volumeInfo.imageLinks.thumbnail){
            cell.image.sd_setImage(with: imgLink,placeholderImage: nil)
        }
        return cell
    }
}

extension AuthorsList:UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 130, height: 160)
    }
}

// MARK: - Preview
#Preview {
    let list = AuthorsList()
    return list
}

