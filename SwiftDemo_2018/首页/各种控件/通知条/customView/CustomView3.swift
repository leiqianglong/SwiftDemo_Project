//
//  CustomView1.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class CustomView3: UIView {

    var customView:EBCustomBannerView?
    
    @IBAction func btn(_ sender: Any) {
        self.customView?.hide()
    }
}
