//
//  BazarTextField.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 02/12/24.
//

import UIKit

class BazarTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    func setup(){
        let height = heightAnchor.constraint(equalToConstant: 48)
        let leadingPadding: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        font = .body
        layer.borderColor = .none
        layer.cornerRadius = 8
        backgroundColor = UIColor(named: "textFieldBackground")
        height.isActive = true
        leftViewMode = .always
        leftView = leadingPadding
    }
    
}
