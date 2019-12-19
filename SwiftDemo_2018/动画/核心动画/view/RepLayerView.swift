//
//  RepLayerView.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class RepLayerView: UIView {

    //改变当前view的 CALyer 为 CAReplicatorLayer 即可复制层
    //改变类型
    override class var layerClass: AnyClass { return  CAReplicatorLayer.self}
    
   

}
