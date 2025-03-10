
import UIKit
class  BestVendorsCell: UICollectionViewCell {

    
    var image:UIImageView = {
        let img =  UIImageView(image:UIImage(named: "bestVendorsImg")!)
        img.clipsToBounds = true
        img.layer.cornerRadius = 8
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setup
        backgroundColor = .textFieldBackground
        layer.cornerRadius = 8
        addSubview(image)
        //layout
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: 100),
            heightAnchor.constraint(equalToConstant: 100),
            //image
            image.widthAnchor.constraint(equalToConstant: 80),
            image.centerYAnchor.constraint(equalTo: centerYAnchor),
            image.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
#Preview{
    BestVendorsCell()
}

