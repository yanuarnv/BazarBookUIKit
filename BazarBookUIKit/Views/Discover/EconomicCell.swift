
import UIKit
class  EconomicCell: UICollectionViewCell {
    
    private let colum = {
        let colum = UIStackView()
        colum.axis = .vertical
        colum.alignment = .leading
        colum.spacing = 8
        return colum
    }()
    
    let title:UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .body
        label.numberOfLines = 2
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    var image:UIImageView = {
        let img =  UIImageView(image:UIImage(named: "exampleTopWeekImg")!)
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.contentMode = .scaleAspectFill
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setup
        [image,title].forEach{
            colum.addArrangedSubview($0)
        }
        addSubview(colum)
        //layout
        [colum,title,image].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            //image
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalToConstant: 140),
            //colum
            colum.centerYAnchor.constraint(equalTo: centerYAnchor),
            colum.centerXAnchor.constraint(equalTo: centerXAnchor),
            colum.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
#Preview{
    var widget = EconomicCell()
    return widget
}

