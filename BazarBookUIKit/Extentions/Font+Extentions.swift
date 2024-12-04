//
//  Font+Extentions.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 11/10/24.
//
import UIKit

// Family: Inter 24pt Font names: ["Inter24pt-Regular", "Inter24pt-Italic", "Inter24pt-Light", "Inter24pt-SemiBold"]
extension UIFont {
    static var largeTitle:UIFont {
        return UIFont(name: "Inter24pt-SemiBold", size: 34)!
    }
    
    static var title1:UIFont {
        UIFont(name: "Inter24pt-Regular", size: 28)!
    }
    
    static var title2:UIFont {
        UIFont(name: "Inter24pt-Regular", size: 22)!
    }
    
    static var title3:UIFont {
        UIFont(name: "Inter24pt-Regular", size: 20)!
    }
    
    static var body:UIFont {
        UIFont(name: "Inter24pt-Regular", size: 17)!
    }
    
    static var bodyBold:UIFont {
        UIFont(name: "Inter24pt-SemiBold", size: 17)!
    }
    
    static var callout:UIFont {
        UIFont(name: "Inter24pt-Regular", size: 16)!
    }
    
    static var subHead:UIFont {
        UIFont(name: "Inter24pt-Regular", size: 15)!
    }
    
}
