//
//  UIColor-extension.swift
//  GesturePasswordView
//
//  Created by liuchunchao on 2018/1/10.
//  Copyright © 2018年 hi-wallet. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func colorWithHexString(hex: String) ->UIColor {
        var cString = hex.trimmingCharacters(in:CharacterSet.whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) {
            cString = cString.substring(from: 1)
        }
        if (cString.count != 6){
            return UIColor.red
        }
        let rString = cString.substring(to:2)
        let otherString = cString.substring(from:2)
        let gString = otherString.substring(to:2)
        let bString = otherString.substring(from:2)
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        Scanner(string: rString).scanHexInt32(&r)
        Scanner(string: gString).scanHexInt32(&g)
        Scanner(string: bString).scanHexInt32(&b)
        return UIColor(red: CGFloat(r) / 255.0, green: CGFloat(g) / 255.0, blue: CGFloat(b) / 255.0, alpha: CGFloat(1))
    }
    
    class func rgb(_ r: Int, _ g: Int, _ b: Int) -> UIColor {
        return UIColor.init(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1.0)
    }
    
    class func hexRGB(_ rgbValue: Int) -> UIColor {
        return UIColor.init(red: ((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0, green: ((CGFloat)((rgbValue & 0xFF00) >> 8))/255.0, blue: ((CGFloat)(rgbValue & 0xFF))/255.0, alpha: 1.0)
    }
    //随机色
    class func randomColor() -> UIColor {
        let r:CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        let g:CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        let b:CGFloat = CGFloat(arc4random_uniform(256)) / 255.0
        return UIColor.init(red: r, green: g, blue: b, alpha: 1)
    }
    
}
