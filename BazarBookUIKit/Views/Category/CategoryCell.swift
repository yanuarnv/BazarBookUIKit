import UIKit

class CategoryCell: UICollectionViewCell {
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
}

#Preview {
    CategoryCell()
}
