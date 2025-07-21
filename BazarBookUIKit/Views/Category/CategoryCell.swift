import UIKit

class CategoryCell: UICollectionViewCell {
    private let imagSkeleton = CAGradientLayer.skeletonGradientLayer(in: CGRect(x: 0, y: 0, width: 150, height: 200))
    private let titleSkeleton = CAGradientLayer.skeletonGradientLayer(in: CGRect(x: 0, y: 0, width: 150, height: 17))
    private let subtitleSkeleton = CAGradientLayer.skeletonGradientLayer(in: CGRect(x: 0, y: 0, width: 150, height: 17))
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setup
        [image,title,subtitle].forEach{
            layout.addArrangedSubview($0)
        }
        
        addSubview(layout)
        
        NSLayoutConstraint.activate([
            //image
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalTo: widthAnchor),
            //colum
            layout.widthAnchor.constraint(equalTo:widthAnchor)
        ])
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
        UIL.translatesAutoresizingMaskIntoConstraints = false
        return UIL
    }()
    
    var  subtitle: UILabel = {
        let UIL = UILabel()
        UIL.text = "Cadence"
        UIL.font = .body
        UIL.textColor = .secondaryLabel
        UIL.translatesAutoresizingMaskIntoConstraints = false
        return UIL
    }()
    
    private let layout: UIStackView = {
        let colum = UIStackView()
        colum.axis = .vertical
        colum.spacing = 4
        colum.translatesAutoresizingMaskIntoConstraints = false
        return colum
    }()
    private func showSkeleton() {
        self.image.layer.addSublayer(imagSkeleton)
        self.title.layer.addSublayer(titleSkeleton)
        self.subtitle.layer.addSublayer(subtitleSkeleton)
    }
    
    private func hideSkeleton() {
        self.image.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        self.title.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        self.subtitle.layer.sublayers?.forEach{$0.removeFromSuperlayer()}
        
    }
    func configure(with item: BookItem?, isLoading: Bool = false) {
        if isLoading {
            showSkeleton()
        }else{
            hideSkeleton()
        }
        
        guard let item = item, !isLoading else { return }
        
        title.text = item.volumeInfo.title.isEmpty ? "No title" : item.volumeInfo.title
        subtitle.text = item.volumeInfo.subtitle == nil ?"No subtitle" : item.volumeInfo.subtitle
        if let imageURL = URL(string: item.volumeInfo.imageLinks.thumbnail) {
            image.sd_setImage(with: imageURL, placeholderImage: UIImage(named: "placeholder"))
        }
    }
    override func layoutSublayers(of layer: CALayer) {
        imagSkeleton.frame = image.frame
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        image.image = nil
        title.text = nil
        subtitle.text = nil
        hideSkeleton()
    }
}

#Preview {
    let x = CategoryCell()
    x.configure(with: nil, isLoading: true)
    return x
}
