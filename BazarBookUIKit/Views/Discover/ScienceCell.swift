import UIKit

class ScienceCell: UICollectionViewCell {
    
    // MARK: - UI Elements
    private let colum: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 8
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .systemGray6
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    private func setupViews() {
        [image, title].forEach {
            colum.addArrangedSubview($0)
        }
        contentView.addSubview(colum)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            // Content constraints
            colum.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            colum.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            colum.widthAnchor.constraint(equalToConstant: 150),
            
            // Image constraints
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
    private func showSkeleton() {
        let imagSkeleton = CAGradientLayer.skeletonGradientLayer(in: CGRect(x: 0, y: 0, width: 150, height: 200))
        let titleSkeleton = CAGradientLayer.skeletonGradientLayer(in: CGRect(x: 0, y: 0, width: 150, height: 17))
        self.image.layer.addSublayer(imagSkeleton)
        self.title.layer.addSublayer(titleSkeleton)
    }
    
    private func hideSkeleton() {
        self.image.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        self.title.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        
    }
    
    // MARK: - Configuration
    func configure(with item: BookItem?, isLoading: Bool = false) {
        if isLoading {
            showSkeleton()
        }else{
            hideSkeleton()
        }
        
        guard let item = item, !isLoading else { return }
        
        title.text = item.volumeInfo.title
        if let imageURL = URL(string: item.volumeInfo.imageLinks.thumbnail) {
            image.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
        }
    }
    
    // MARK: - Reuse
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        title.text = nil
        colum.alpha = 1
        hideSkeleton()
    }
}

#Preview{
    let x = ScienceCell()
    x.configure(with: nil, isLoading: true)
    return x
}
