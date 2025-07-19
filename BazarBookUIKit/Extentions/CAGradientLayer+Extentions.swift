//
//  CAGradientLayer+Extentions.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 20/07/25.
//

import UIKit


extension CAGradientLayer{
    static func skeletonGradientLayer(in frame:CGRect) -> Self{
        let layer = Self()
        layer.colors = [
            UIColor(white: 0.85, alpha: 1.0).cgColor,
            UIColor(white: 0.95, alpha: 1.0).cgColor,
            UIColor(white: 0.85, alpha: 1.0).cgColor
        ]
        layer.locations = [0, 0.5, 1]
        layer.startPoint = CGPoint(x: 0, y: 0.5)
        layer.endPoint = CGPoint(x: 1, y: 0.5)
        layer.frame = frame
        
        let animation = CABasicAnimation(keyPath: "locations")
        animation.fromValue = [-1.0, -0.5, 0.0]
        animation.toValue = [1.0, 1.5, 2.0]
        animation.duration = 1.2
        animation.repeatCount = .infinity
        
        layer.add(animation, forKey: "animation")
        return layer
    }
}
