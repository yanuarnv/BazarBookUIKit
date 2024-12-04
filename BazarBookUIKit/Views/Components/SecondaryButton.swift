//
//  PrimaryButton.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 08/09/24.
//

import UIKit

class SecondaryButton: UIButton{
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
        configuration?.background.backgroundColor = UIColor(named: "secondaryColor")
        layer.cornerRadius  = 12
        // Set a bold font for the button title
        let boldFont = UIFont(name: "Inter24pt-SemiBold", size: 16) // Adjust size as needed
        configuration?.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = boldFont
            return outgoing
        }
    }
    
    func configuration(title:String){
        setTitle("Sign in", for: .normal)
        setTitleColor(UIColor(named: "primaryColor"), for: .normal)
    }
}

