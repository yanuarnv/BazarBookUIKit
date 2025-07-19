import UIKit

class CellSkeleton: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        [image, title].forEach {
            layout.addArrangedSubview($0)
        }
        
        addSubview(layout)
        
        NSLayoutConstraint.activate([
            // Image
            image.heightAnchor.constraint(equalToConstant: 200),
            image.widthAnchor.constraint(equalTo: widthAnchor),
            // Title
            title.widthAnchor.constraint(equalToConstant: 100),
            title.heightAnchor.constraint(equalToConstant: 17),
            // Layout
            layout.widthAnchor.constraint(equalTo: widthAnchor)
        ])
    }
    
    // MARK: - UI Elements
    var image: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        // shimer
        let skeletonAnimation = CAGradientLayer.skeletonGradientLayer(in: CGRect(x: 0, y: 0, width: 150, height: 178))
        
        view.layer.addSublayer(skeletonAnimation)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var title: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        let skeletonAnimation = CAGradientLayer.skeletonGradientLayer(in: CGRect(x: 0, y: 0, width: 100, height: 17))
        view.layer.addSublayer(skeletonAnimation)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let layout: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 4
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
}
#Preview{
    CellSkeleton()
}
