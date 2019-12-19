//
//  MusicController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class MusicController: UIViewController {

    @IBOutlet weak var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        //复制层
        let repLayer = CAReplicatorLayer()
        repLayer.frame = self.contentView.bounds
        repLayer.instanceCount = 4 //复制的分数
        //没份平移的位置
        repLayer.instanceTransform = CATransform3DMakeTranslation(40, 0, 0)
        //设置动画延迟执行的时间
        repLayer.instanceDelay = 0.2
        self.contentView.layer.addSublayer(repLayer)
        
        
        let layer = CALayer.init()
        let width:CGFloat = 30.0
        let height:CGFloat = 100.0
        layer.bounds = CGRect(x: 0, y: 0, width: width, height: height)
        layer.backgroundColor = UIColor.orange.cgColor
        //设置锚点
        layer.anchorPoint = CGPoint(x: 0, y:1)
        layer.position = CGPoint(x: 0, y: self.contentView.bounds.size.height)
        repLayer.addSublayer(layer)
        
        let anim = CABasicAnimation.init()
        anim.keyPath = "transform.scale.y"
        anim.toValue = 0
        anim.duration = 0.5
        anim.autoreverses = true//自动翻转
        anim.repeatCount = MAXFLOAT
        layer.add(anim, forKey: nil)
    }


}
