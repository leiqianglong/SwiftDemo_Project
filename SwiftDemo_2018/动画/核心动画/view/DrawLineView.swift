//
//  DrawLineView.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class DrawLineView: UIView {
    //改变当前view的 CALyer 为 CAReplicatorLayer 即可复制层
    //改变类型
    override class var layerClass: AnyClass { return  CAReplicatorLayer.self}
    
    
    var path:UIBezierPath!
    var liziLayer:CALayer!
    override func awakeFromNib() {
        super.awakeFromNib()
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(pan(pan:)))
        self.addGestureRecognizer(pan)
         path = UIBezierPath.init()
        
        ///开始创建粒子
        liziLayer = CALayer.init()
        liziLayer.frame = CGRect(x: -10, y: 0, width: 10, height: 10)
        liziLayer.backgroundColor = UIColor.red.cgColor
        self.layer.addSublayer(liziLayer)
   
        let repLay = self.layer as! CAReplicatorLayer
        repLay.instanceCount = 30
        repLay.instanceDelay = 0.25
    }
    override func draw(_ rect: CGRect) {
        path.stroke()
    }
 
    @objc func pan(pan:UIPanGestureRecognizer){
        let currentP = pan.location(in: self)
        if pan.state == .began {
            path.move(to: currentP)
        }else if pan.state == .changed{
            path.addLine(to: currentP)
            setNeedsDisplay()
        }
    }

    func start() {
        //添加动画
        let anim = CAKeyframeAnimation.init()
        anim.keyPath = "position"
        anim.path = path.cgPath
        anim.repeatCount = MAXFLOAT
        anim.duration = 4
        liziLayer.add(anim, forKey: nil)
    }
    func reDraw() {
        //清空路径
        path.removeAllPoints()
        setNeedsDisplay()
        //移除动画
        liziLayer.removeAllAnimations()
    }
}
