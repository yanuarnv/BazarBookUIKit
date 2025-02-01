//
//  PrimaryButton.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 08/09/24.
//

import UIKit

class SosialMediaButton: UIButton{
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
        heightAnchor.constraint(equalToConstant: 48).isActive = true
        configuration?.background.backgroundColor = .white
        configuration?.baseForegroundColor = .black
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemGray2.cgColor
        layer.cornerRadius = 24
        titleLabel?.font = UIFont(name: "Inter_24pt-Regular", size: 10)
        configuration?.imagePadding = 10
    }
    
    
}

extension SosialMediaButton {
    func googleSignIn(){
        configuration?.image = UIImage(named: "google")
        setTitle("Sign in with Google", for: .normal)
        setTitleColor(.black, for: .normal)
    }
    
    func appleSignIn(){
        configuration?.image = UIImage(named: "apple")
        setTitle("Sign in with Apple", for: .normal)
        setTitleColor(.black, for: .normal)
    }
}

#Preview{
    let btn = SosialMediaButton()
    btn.appleSignIn()
    btn.widthAnchor.constraint(equalToConstant: 200).isActive = true
    return btn
}
