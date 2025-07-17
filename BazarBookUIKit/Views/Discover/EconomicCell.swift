
import UIKit
class  EconomicCell: UICollectionViewCell {
    var isLoading = false {
        didSet {
            updateView()
        }
    }

    private let colum = {
        let colum = UIStackView()
        colum.axis = .vertical
        colum.alignment = .leading
        colum.spacing = 8
        colum.translatesAutoresizingMaskIntoConstraints = false
        return colum
    }()
    
    let title:UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .body
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var image:UIImageView = {
        let img =  UIImageView(image:UIImage(named: "exampleTopWeekImg")!)
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    let skeleton:CellSkeleton = {
        let skeleton = CellSkeleton()
        skeleton.translatesAutoresizingMaskIntoConstraints = false
        return skeleton
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func updateView() {
        contentView.subviews.forEach { $0.removeFromSuperview() }
        if isLoading {
            contentView.addSubview(skeleton)
            NSLayoutConstraint.activate([
                skeleton.topAnchor.constraint(equalTo: contentView.topAnchor),
                skeleton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                skeleton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                skeleton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        } else {
            // Setup layout for real content
            [image, title].forEach {
                colum.addArrangedSubview($0)
            }
            contentView.addSubview(colum)
            NSLayoutConstraint.activate([
                image.heightAnchor.constraint(equalToConstant: 200),
                image.widthAnchor.constraint(equalToConstant: 140),
                colum.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
                colum.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
                colum.widthAnchor.constraint(equalToConstant: 150)
            ])
        }
    }
    
}
#Preview{
    var widget = EconomicCell()
    widget.isLoading = true
    return widget
}

