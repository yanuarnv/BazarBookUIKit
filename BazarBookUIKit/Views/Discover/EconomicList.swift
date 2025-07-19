import UIKit
import SDWebImage

class EconomicList: UIView {
    @Inject private var viewModel: HomeViewModel
    
    // MARK: - Loading State
    private var isLoading = true
    
    private let skeletonCellCount = 6
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Data Loading
    @MainActor
    func loadData() async {
        isLoading = true
        
        await viewModel.getEconomicBooks(maxResult: 6) {error in
            
        }
        isLoading = false
//        self.collectionView.reloadData()
    }
    
    // MARK: - UI Components
    private let layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .clear
        collectionView.register(EconomicCell.self, forCellWithReuseIdentifier: "EconomicCell")
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
        label.text = "Economic"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    private let headerSubTitle: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
        button.tintColor = .systemBlue
        return button
    }()
    
    private let column: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
}

// MARK: - Setup Layout
extension EconomicList {
    private func setup() {
        setupViews()
        setupConstraints()
        setupActions()
    }
    
    private func setupViews() {
        [headerTitle, headerSubTitle].forEach {
            rowList.addArrangedSubview($0)
        }
        
        [rowList, collectionView].forEach {
            column.addArrangedSubview($0)
        }
        
        [headerTitle, headerSubTitle, rowList, collectionView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addSubview(column)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            column.topAnchor.constraint(equalTo: topAnchor),
            column.bottomAnchor.constraint(equalTo: bottomAnchor),
            column.trailingAnchor.constraint(equalTo: trailingAnchor),
            column.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            collectionView.heightAnchor.constraint(equalToConstant: 250),
            
            rowList.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headerSubTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
    
    private func setupActions() {
        headerSubTitle.addTarget(self, action: #selector(seeAllTapped), for: .touchUpInside)
    }
    
    @objc private func seeAllTapped() {
        // Handle see all action
        print("See all tapped")
    }
}

// MARK: - UICollectionView DataSource
extension EconomicList: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return isLoading ? skeletonCellCount : viewModel.economicList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EconomicCell", for: indexPath) as? EconomicCell else {
            return UICollectionViewCell()
        }
        
//        if isLoading {
//            cell.configure(with: nil, isLoading: true)
//        } else {
//            let item = viewModel.economicList[indexPath.item]
//            cell.configure(with: item, isLoading: false)
//        }
        cell.configure(with: nil, isLoading: true)
        
        return cell
    }
}

// MARK: - UICollectionView Delegate & Flow Layout
extension EconomicList: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard !isLoading else { return }
        
        let item = viewModel.economicList[indexPath.item]
        // Handle item selection
        print("Selected: \(item.volumeInfo.title)")
    }
}

#Preview{
    PreviewHelper.homeViewController()
}
