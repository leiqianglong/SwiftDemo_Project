//
//  MyClockView.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class MyClockView: UIImageView {
    //每秒旋转6°
    let persencond:Float = 6.0
    //每分旋转6°
    let perMin:Float = 6.0
    //每分旋转6°
    let perHour:Float = 30.0
    
    var secondLayer:CALayer!
    var minLayer:CALayer!
    var hourLayer:CALayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        image = UIImage(named: "钟表")
        setupClock()
        clock()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //时钟
    func setupClock() {
        //添加时针
        hourLayer = CALayer.init()
        hourLayer.cornerRadius = 4
        hourLayer.backgroundColor = UIColor.black.cgColor
        hourLayer.bounds = CGRect(x: 0, y: 0, width: 4, height: 28)
        hourLayer.position = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.5)
        hourLayer.anchorPoint = CGPoint(x: 0.5, y: 1)//锚点
        self.layer.addSublayer(hourLayer)
        
        //添加分针
        minLayer = CALayer.init()
        minLayer.cornerRadius = 3
        minLayer.backgroundColor = UIColor.black.cgColor
        minLayer.bounds = CGRect(x: 0, y: 0, width: 3, height: 32)
        minLayer.position = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.5)
        minLayer.anchorPoint = CGPoint(x: 0.5, y: 1)//锚点
        self.layer.addSublayer(minLayer)
        
        //添加秒针
        secondLayer = CALayer.init()
        secondLayer.cornerRadius = 1
        secondLayer.backgroundColor = UIColor.red.cgColor
        secondLayer.bounds = CGRect(x: 0, y: 0, width: 1.5, height: 40)
        secondLayer.position = CGPoint(x: self.bounds.size.width*0.5, y: self.bounds.size.height*0.5)
        secondLayer.anchorPoint = CGPoint(x: 0.5, y: 1)//锚点
        self.layer.addSublayer(secondLayer)
        
        //添加定时器
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(clock), userInfo: nil, repeats: true)
    }
    @objc func clock(){
        //秒针旋转
        let canld = Calendar.current
        //日历单元
        let curSecond = canld.component(Calendar.Component.second, from: Date())
        let angle : Float = Float(curSecond) * persencond
        secondLayer.transform = CATransform3DMakeRotation(CGFloat(angle/180.0*Float.pi), 0, 0, 1)
        
        //分针开始旋转
        let curMin = canld.component(Calendar.Component.minute, from: Date())
        let minAngle : Float = Float(curMin) * perMin
        minLayer.transform = CATransform3DMakeRotation(CGFloat(minAngle/180.0*Float.pi), 0, 0, 1)
        
        //时针开始旋转
        let curHour = canld.component(Calendar.Component.hour, from: Date())
        let hourAngle : Float = Float(curHour) * perHour + Float(curMin)*0.5
        hourLayer.transform = CATransform3DMakeRotation(CGFloat(hourAngle/180.0*Float.pi), 0, 0, 1)
        
    }
}
