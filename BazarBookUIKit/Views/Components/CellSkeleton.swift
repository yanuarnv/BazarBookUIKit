import UIKit

class CellSkeleton: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        //setup
        [image,title,subtitle].forEach{
            layout.addArrangedSubview($0)
        }
        
        addSubview(layout)
        
        NSLayoutConstraint.activate([
            //image
            image.heightAnchor.constraint(equalToConstant: 178),
            image.widthAnchor.constraint(equalTo: widthAnchor),
            // title
            title.widthAnchor.constraint(equalToConstant: 100),
            title.heightAnchor.constraint(equalToConstant: 17),
            //subtitle
            subtitle.widthAnchor.constraint(equalToConstant: 100),
            subtitle.heightAnchor.constraint(equalToConstant: 17),
            //colum
            layout.widthAnchor.constraint(equalTo:widthAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var image: UIView = {
        let UII = UIView()
        UII.backgroundColor = .lightGray
        UII.layer.cornerRadius = 8
        UII.clipsToBounds = true
        UII.translatesAutoresizingMaskIntoConstraints = false
        return UII
    }()
    
    var title: UIView = {
        let UIL = UIView()
        UIL.layer.cornerRadius = 8
        UIL.clipsToBounds = true
        UIL.backgroundColor = .lightGray
        UIL.translatesAutoresizingMaskIntoConstraints = false
        return UIL
    }()
    
    var  subtitle: UIView = {
        let UIL = UIView()
        UIL.layer.cornerRadius = 8
        UIL.clipsToBounds = true
        UIL.backgroundColor = .lightGray
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
    CellSkeleton()
}
