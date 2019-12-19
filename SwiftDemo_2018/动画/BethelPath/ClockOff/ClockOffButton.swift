//
//  ClockOffButton.swift
//  Animation
//
//  Created by yaoxinpan on 2018/3/9.
//  Copyright © 2018年 yaoxp. All rights reserved.
//

import UIKit
import AudioToolbox

class ClockOffButton: UIButton {
    let shapeLayer = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.clear
        
        let path = UIBezierPath.init(ovalIn: frame)

        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.red.cgColor
        shapeLayer.strokeColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 8
        shapeLayer.lineCap = kCALineCapRound
        layer.addSublayer(shapeLayer)

        addTarget(self, action: #selector(touchDown), for: UIControlEvents.touchDown)
        addTarget(self, action: #selector(touchUp), for: UIControlEvents.touchUpInside)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        let path = UIBezierPath.init(ovalIn: layer.bounds)
        shapeLayer.path = path.cgPath
    }
    
    @objc func touchDown() {
        shapeLayer.strokeColor = UIColor.yellow.cgColor
        let animation = CABasicAnimation.init(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2.0
        animation.delegate = self
        shapeLayer.add(animation, forKey: "clockOff")
    }
    
    @objc func touchUp() {
        if shapeLayer.animation(forKey: "clockOff") != nil {
            shapeLayer.strokeColor = UIColor.clear.cgColor
            shapeLayer.removeAnimation(forKey: "clockOff")
        }
    }
}

extension ClockOffButton: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        shapeLayer.removeAnimation(forKey: "clockOff")
        if flag {
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
        }
    }
}
