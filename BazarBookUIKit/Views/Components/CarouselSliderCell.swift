import UIKit
class  CarouselSliderCell: UICollectionViewCell {
    private let row = {
        let row = UIStackView()
        row.axis = .horizontal
        row.alignment = .center
        return row
    }()
    
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
        label.font = .title1
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
            //image
            image.heightAnchor.constraint(equalToConstant: 165),
            image.widthAnchor.constraint(equalToConstant: 140),
            
            colum.bottomAnchor.constraint(equalTo: buttonOrder.bottomAnchor),
            colum.leadingAnchor.constraint(equalTo: row.leadingAnchor,constant: 16),
            
            row.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            row.leadingAnchor.constraint(equalTo: leadingAnchor),
            row.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomAnchor.constraint(equalTo: row.bottomAnchor)
            
            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
#Preview{
    CarouselSliderCell()
}

