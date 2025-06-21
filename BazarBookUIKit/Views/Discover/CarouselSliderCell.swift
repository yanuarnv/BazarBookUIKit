import UIKit
class  CarouselSliderCell: UICollectionViewCell {
    private let row = {
        let row = UIStackView()
        row.axis = .horizontal
        row.alignment = .center
        row.distribution = .equalSpacing
        return row
    }()
    
    private let colum = {
        let colum = UIStackView()
        colum.axis = .vertical
        colum.alignment = .leading
        colum.distribution = .equalSpacing
        colum.spacing = 8
        return colum
    }()
    
    let title:UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = .title2
        return label
    }()
    
    let subTitle:UILabel = {
        let label = UILabel()
        label.text = "Sub title"
        label.font = .body
        return label
    }()
    
    let buttonOrder:PrimaryButton = {
        let btn = PrimaryButton()
        btn.configuration(title: "Order Now")
        return btn
    }()
    
    var image:UIImageView = UIImageView(image:UIImage(named: "example_banner")!)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setup
        [title,subTitle,buttonOrder].forEach{
            colum.addArrangedSubview($0)
        }
        [colum,image].forEach{
            row.addArrangedSubview($0)
        }
        addSubview(row)
        //style
        layer.cornerRadius = 8
        backgroundColor = UIColor(named: "primary50Color")
        //layout
        [colum,row,title,subTitle,image,buttonOrder].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            // Image constraints
            image.heightAnchor.constraint(equalToConstant: 165),
            image.widthAnchor.constraint(equalToConstant: 140),
            
            // Column constraints
            colum.bottomAnchor.constraint(lessThanOrEqualTo: row.bottomAnchor), // Avoid strict bottom constraint
            colum.leadingAnchor.constraint(equalTo: row.leadingAnchor),
            
            // Row constraints
            row.topAnchor.constraint(equalTo: topAnchor, constant: 16), // Avoid safeAreaLayoutGuide in cells
            row.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            row.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -16),
            row.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
#Preview{
    CarouselSliderCell()
}

