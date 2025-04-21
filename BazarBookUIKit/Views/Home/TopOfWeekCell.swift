
import UIKit
class  TopOfWeekCell: UICollectionViewCell {
    
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
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let subTitle:UILabel = {
        let label = UILabel()
        label.text = "Sub title"
        label.textColor = .primary
        label.font = .subHeadBold
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
        [image,title,subTitle].forEach{
            colum.addArrangedSubview($0)
        }
        addSubview(colum)
        //layout
        [colum,title,subTitle,image].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            //image
            image.heightAnchor.constraint(equalToConstant: 150),
            image.widthAnchor.constraint(equalToConstant: 127),
            //colum
            colum.centerYAnchor.constraint(equalTo: centerYAnchor),
            colum.centerXAnchor.constraint(equalTo: centerXAnchor),
            colum.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
#Preview{
    var widget = TopOfWeekCell()
    let item = BookModel.dummy().first!
    widget.title.text = item.volumeInfo.title
    widget.subTitle.text = item.volumeInfo.description
    widget.image.image = UIImage(systemName: "photo.fill")
    return widget
}

