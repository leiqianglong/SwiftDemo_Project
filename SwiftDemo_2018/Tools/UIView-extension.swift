//
//  UIView-extension.swift
//  GesturePasswordView
//
//  Created by liuchunchao on 2018/1/10.
//  Copyright © 2018年 hi-wallet. All rights reserved.
//

import UIKit

extension UIView {
    
    func height () -> CGFloat{
        return self.frame.size.height
    }
    
    func width () -> CGFloat{
        return self.frame.size.width
    }
    
    func right() -> CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }
    
    func bottom() -> CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    
    func top() -> CGFloat {
        return self.frame.origin.y
    }
    
}
