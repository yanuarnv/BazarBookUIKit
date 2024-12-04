//
//  PrimaryButton.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 08/09/24.
//

import UIKit

class PrimaryButton: UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup(){
        configuration = .filled()
        clipsToBounds = true
        layer.cornerRadius = 24
        heightAnchor.constraint(equalToConstant: 48).isActive = true
        configuration?.background.backgroundColor = UIColor(named: "primaryColor")
        // Set a bold font for the button title
        let boldFont = UIFont(name: "Inter24pt-SemiBold", size: 16) // Adjust size as needed
        configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = boldFont
            return outgoing
        }
    }
    
    func configuration(title:String = "Continue"){
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
    }
}

