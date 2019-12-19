//
//  LineController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/3/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class LineController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if navigationItem.title == "LineDraw" {
            drawLineAnimation()
        }else  if navigationItem.title == "WaveLine" {
            let waveLineView = WaveLineView(frame: view.bounds)
            view.addSubview(waveLineView)
        }

        
    }
    fileprivate func drawLineAnimation(){
        
        //创建一个Layer用于显示
        let shapeLayer = CAShapeLayer()
        
        //设置区域
        shapeLayer.frame = view.bounds
        
        //边框颜色
        shapeLayer.strokeColor = UIColor.red.cgColor
        
        shapeLayer.fillColor = nil
        
        //边框宽度
        shapeLayer.lineWidth = 2
        
        
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x:100 , y: 100, width:200, height :200 ), cornerRadius: 100).cgPath
        
        //
        view.layer.addSublayer(shapeLayer)
        
        //创建动画
        let drawLineAni = Animate.baseAnimationWithKeyPath("strokeEnd", fromValue: 0, toValue: 1, duration: 0.9, repeatCount: Float.infinity, timingFunction: nil)
        
        //翻转
        drawLineAni.autoreverses = true
        
        shapeLayer.add(drawLineAni, forKey: "drawLineAnimation")
        
        
    }

}
