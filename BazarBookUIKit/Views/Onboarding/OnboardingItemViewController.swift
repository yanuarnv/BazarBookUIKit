//
//  FirstOnboardingViewController.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 06/09/24.
//

import UIKit

class OnboardingItemViewController: UIViewController {
    
    let image = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let content = UIStackView()
    
    init(model: OnBoardingModel) {
        super.init(nibName: nil, bundle: nil)
        image.image = UIImage(named:model.imageName)
        titleLabel.text = model.title
        descriptionLabel.text = model.description
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        style()
        layout()
    }
}

extension OnboardingItemViewController {
    
    
    func style(){
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.font = .boldSystemFont(ofSize: titleLabel.font.pointSize)
        titleLabel.textColor = .textPrimary
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .body)
        descriptionLabel.textColor = .textSecondary
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 3
        
        content.axis = .vertical
        content.spacing = 16
        content.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout(){
        content.addArrangedSubview(image)
        content.addArrangedSubview(titleLabel)
        content.addArrangedSubview(descriptionLabel)
        
        view.addSubview(content)
        
        NSLayoutConstraint.activate([
            content.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 16),
            content.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            content.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            image.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            
        ])
    }
}


#Preview{
    OnboardingItemViewController(model: OnBoardingModel(id: 0, imageName: "onboardingFirst", title: "Now reading books will be easier", description: "Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us."))
}
