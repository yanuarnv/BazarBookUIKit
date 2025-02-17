import UIKit

class ForgotPasswordViewController :UIViewController {
    private let forgotPasswordTitle:UILabel = {
        let label = UILabel()
        label.text = "Forgot Password"
        label.font = .largeTitle
        return label
    }()
    private let forgotPasswordDescription:UILabel = {
        let label = UILabel()
        label.text = "Select which contact details should we use to reset your password"
        label.font = .body
        label.numberOfLines = 0
        return label
    }()
    private let forgotPasswordMethodContainer:UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private let emailCard:ForgotPasswordCard = {
        let card = ForgotPasswordCard()
        card.title = "Email"
        card.subtitle = "Send to your email"
        card.iconName.image = UIImage(named: "icon-email")
        return card
    }()
    
    private let phoneCard:ForgotPasswordCard = {
        let card = ForgotPasswordCard()
        card.title = "Phone Number"
        card.subtitle = "Send to your phone"
        card.iconName.image = UIImage(named: "icon-phone")
        return card
    }()
    
    private let continueButton:PrimaryButton = {
        let btn = PrimaryButton()
        btn.configuration(title: "Continue")
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
}


extension ForgotPasswordViewController {
    func setup() {
        [emailCard,phoneCard].forEach{
            forgotPasswordMethodContainer.addArrangedSubview($0)
        }
        [forgotPasswordTitle,forgotPasswordDescription,forgotPasswordMethodContainer,continueButton].forEach{ e in
            view.addSubview(e)
        }
    }
    
    func style() {
        
        
        
        [forgotPasswordTitle,forgotPasswordDescription,forgotPasswordMethodContainer,emailCard,phoneCard,continueButton].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            forgotPasswordTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            forgotPasswordTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            forgotPasswordTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            
            forgotPasswordDescription.topAnchor.constraint(equalTo: forgotPasswordTitle.bottomAnchor,constant: 8),
            forgotPasswordDescription.leadingAnchor.constraint(equalTo: forgotPasswordTitle.leadingAnchor),
            forgotPasswordDescription.trailingAnchor.constraint(equalTo: forgotPasswordTitle.trailingAnchor),
            
            forgotPasswordMethodContainer.topAnchor.constraint(equalTo: forgotPasswordDescription.bottomAnchor,constant: 16),
            forgotPasswordMethodContainer.trailingAnchor.constraint(equalTo: forgotPasswordDescription.trailingAnchor),
            forgotPasswordMethodContainer.leadingAnchor.constraint(equalTo: forgotPasswordDescription.leadingAnchor),
            
            continueButton.topAnchor.constraint(equalTo: forgotPasswordMethodContainer.bottomAnchor,constant: 26),
            continueButton.leadingAnchor.constraint(equalTo: forgotPasswordTitle.leadingAnchor),
            continueButton.trailingAnchor.constraint(equalTo: forgotPasswordTitle.trailingAnchor),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
}

extension ForgotPasswordViewController{
    
}


#Preview {
    ForgotPasswordViewController()
}
