//
//  ThroughView.swift
//  HiWallet
//
//  Created by liuchunchao on 2017/12/19.
//  Copyright © 2017年 HiWallet. All rights reserved.
//

import UIKit

class ThroughView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
        
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
       
        return nil
    }
    
}
