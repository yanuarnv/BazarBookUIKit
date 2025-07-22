import UIKit

class SearchCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image: UIImageView = {
        let UII = UIImageView(image: UIImage(named: "exampleTopWeekImg"))
        UII.layer.cornerRadius = 8
        UII.clipsToBounds = true
        UII.contentMode = .scaleAspectFill
        UII.translatesAutoresizingMaskIntoConstraints = false
        return UII
    }()
    
    var title: UILabel = {
        let UIL = UILabel()
        UIL.text = "Podcast Name"
        UIL.font = .body
        UIL.numberOfLines = 2
        UIL.translatesAutoresizingMaskIntoConstraints = false
        return UIL
    }()
    
    var subtitle: UILabel = {
        let UIL = UILabel()
        UIL.text = "Cadence"
        UIL.font = .body
        UIL.textColor = .secondaryLabel
        UIL.numberOfLines = 1
        UIL.translatesAutoresizingMaskIntoConstraints = false
        return UIL
    }()
    
    private let textStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.alignment = .leading
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private func setupUI() {
        // Add title and subtitle to text stack
        [title, subtitle].forEach {
            textStackView.addArrangedSubview($0)
        }
        
        // Add image and text stack to content view
        contentView.addSubview(image)
        contentView.addSubview(textStackView)
        
        // FIXED: Horizontal list layout constraints
        NSLayoutConstraint.activate([
            // Image constraints - fixed size on the left
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            image.widthAnchor.constraint(equalToConstant: 80),
            image.heightAnchor.constraint(equalToConstant: 120),
            
            // Text stack constraints - fill remaining space
            textStackView.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 12),
            textStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textStackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            
            // Content view height
            contentView.heightAnchor.constraint(greaterThanOrEqualToConstant: 140)
        ])
        
    }
    
    func configure(with item: BookItem?, isLoading: Bool = false) {
        guard let item = item, !isLoading else {
            // Set default values when no item
            title.text = "Loading..."
            subtitle.text = "Please wait"
            image.image = nil
            return
        }
        
        title.text = item.volumeInfo.title.isEmpty ? "No title" : item.volumeInfo.title
        subtitle.text = item.volumeInfo.subtitle ?? "No subtitle"
        
        if let imageURL = URL(string: item.volumeInfo.imageLinks.thumbnail) {
            image.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
        } else {
            image.image = UIImage(named: "placeholder")
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        title.text = nil
        subtitle.text = nil
    }
}

#Preview{
    SearchCell()
}
