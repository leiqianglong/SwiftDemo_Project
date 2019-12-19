//
//  Qtools.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

import Foundation

class QTools: NSObject {
    //单例
    static let shared : QTools = {
        let instance = QTools()
        return instance
    }()
    //禁止某个界面的侧滑
     func forbidLeftSlide(cavigationCtr:UINavigationController)->(UIPanGestureRecognizer){
        let traget:Any = cavigationCtr.interactivePopGestureRecognizer?.delegate as Any
        let pan = UIPanGestureRecognizer.init(target: traget, action: nil)
        return pan
    }

    
}
