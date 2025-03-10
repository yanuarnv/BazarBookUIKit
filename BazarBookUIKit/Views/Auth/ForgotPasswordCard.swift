import UIKit

class ForgotPasswordCard: UIView {
    // MARK: - Properties
    var title: String = "" {
        didSet {
            titleWidget.text = title
        }
    }
    
    var subtitle: String = "" {
        didSet {
            subTitleWidget.text = subtitle
        }
    }
    
    private let cornerRadius: CGFloat = 16
    private let iconContainerSize: CGFloat = 48
    private let spacing: CGFloat = 16
    
    private let titleWidget: UILabel = {
        let widget = UILabel()
        widget.font = .bodyBold
        widget.adjustsFontForContentSizeCategory = true
        return widget
    }()
    
    private let subTitleWidget: UILabel = {
        let widget = UILabel()
        widget.font = .body
        widget.textColor = .textSecondary
        widget.numberOfLines = 0
        widget.lineBreakMode = .byWordWrapping
        widget.adjustsFontForContentSizeCategory = true
        return widget
    }()
    
    private let iconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 24
        view.clipsToBounds = true
        return view
    }()
    
    private(set) var iconName: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "icon-email") ?? UIImage(systemName: "envelope"))
        return imageView
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        backgroundColor = .textFieldBackground
        layer.cornerRadius = cornerRadius
        layer.borderWidth = 1
        layer.borderColor = UIColor(named: "textFieldBackground")?.cgColor
        
        iconContainer.addSubview(iconName)
        [titleWidget, subTitleWidget, iconContainer].forEach { addSubview($0) }
        
        [titleWidget, subTitleWidget, iconContainer, iconName].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            iconContainer.widthAnchor.constraint(equalToConstant: iconContainerSize),
            iconContainer.heightAnchor.constraint(equalToConstant: iconContainerSize),
            iconContainer.topAnchor.constraint(equalTo: topAnchor, constant: spacing),
            iconContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            
            iconName.centerYAnchor.constraint(equalTo: iconContainer.centerYAnchor),
            iconName.centerXAnchor.constraint(equalTo: iconContainer.centerXAnchor),
            
            titleWidget.topAnchor.constraint(equalTo: iconContainer.bottomAnchor, constant: spacing),
            titleWidget.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            titleWidget.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacing),
            
            subTitleWidget.topAnchor.constraint(equalTo: titleWidget.bottomAnchor, constant: 8),
            subTitleWidget.leadingAnchor.constraint(equalTo: leadingAnchor, constant: spacing),
            subTitleWidget.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -spacing),
            bottomAnchor.constraint(equalTo: subTitleWidget.bottomAnchor, constant: spacing)
        ])
    }
}

#Preview{
    let card = ForgotPasswordCard()
    card.title = "Email"
    card.subtitle = "Send to your emailSend to email"
    card.iconName.image = UIImage(named: "icon-phone")
    return card
}

