//
//  CALyerCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/8.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class CALyerCtr: UIViewController {

    //每秒旋转6°
    let persencond:Float = 6.0
    //每分旋转6°
    let perMin:Float = 6.0
    //每分旋转6°
    let perHour:Float = 30.0
    
    var clcockLayer:CALayer!
    var minLayer:CALayer!
    var hourLayer:CALayer!
    var aniLayer:CALayer!
    var time:Timer!
    @IBOutlet weak var heartView: UIImageView!
    
    @IBOutlet weak var iconView: UIImageView!
    
    
    
    @IBOutlet weak var clockView: UIImageView!
    @IBOutlet weak var redView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        uiviewLayer()
        myLayer()
        animationLayer()

        //时钟
        initClock()
        clock()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.time.invalidate()
        self.time = nil
    }
    deinit {
//        QLog("CALyerCtr销毁了。。。")
    }
    @IBAction func boundsAnimation(_ sender: UIButton) {

        CATransaction.begin()
        //设置事务有没有动画
        CATransaction.setDisableActions(false)
        //设置事务时长
        CATransaction.setAnimationDuration(1.0)
        
        if sender.isSelected {
            self.aniLayer.bounds = CGRect(x: 0, y: UIScreen.main.bounds.size.height-100, width: 50, height: 50)
            self.aniLayer.position = CGPoint(x: 200, y: 300)
        }else{
            self.aniLayer.bounds = CGRect(x: 0, y: UIScreen.main.bounds.size.height-100, width: 100, height: 100)
            self.aniLayer.position = CGPoint(x: 0, y: UIScreen.main.bounds.size.height-150)
        }
        //提交事务
        CATransaction.commit()
      
        sender.isSelected = !sender.isSelected
    }
    func animationLayer() {
        aniLayer = CALayer.init()
        aniLayer.bounds = CGRect(x: 0, y: UIScreen.main.bounds.size.height-100, width: 100, height: 100)
        aniLayer.position = CGPoint(x: 0, y:  UIScreen.main.bounds.size.height-150)
        aniLayer.anchorPoint = CGPoint(x: 0, y: 0)
        aniLayer.backgroundColor = UIColor.purple.cgColor
        self.view.layer.addSublayer(aniLayer)
    }
    func myLayer() {
        let layer = CALayer.init()
        layer.frame = CGRect(x: 20, y: 400, width: 100, height: 100)
        layer.backgroundColor = UIColor.blue.cgColor
        self.view.layer.addSublayer(layer)
        layer.contents = UIImage(named: "icon1")?.cgImage
    }
    func uiviewLayer() {
        //view默认自带阴影效果，透明度默认是0
        self.redView.layer.shadowOpacity = 1.0
        //设置阴影偏移量
        self.redView.layer.shadowOffset = CGSize(width: 20, height: 10)
        self.redView.layer.shadowRadius = 5.0 //模糊的范围
        //设置阴影颜色
        self.redView.layer.shadowColor = UIColor.lightGray.cgColor
        
        //设置边框颜色
        self.redView.layer.borderColor = UIColor.green.cgColor
        //设置边框宽度
        self.redView.layer.borderWidth = 2.0
        self.redView.layer.cornerRadius = 10
        
//        self.redView.layer.masksToBounds
    }
    
    @IBAction func one(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            //缩放
            self.redView.layer.transform =  CATransform3DMakeScale(0.8, 0.8,1)
        }
    }
    @IBAction func two(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            //平移
            self.redView.layer.transform = CATransform3DMakeTranslation(100, 50, 0)
        }
    }
    @IBAction func tre(_ sender: Any) {
        UIView.animate(withDuration: 1) {
              self.redView.layer.transform = CATransform3DMakeRotation(CGFloat(Float.pi), 1, 1, 0)
        }
    }
    
    @IBAction func four(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.redView.layer.transform = CATransform3DMakeRotation(CGFloat(Float.pi), 1, 1, 0)
            //平移
            self.redView.layer.transform = CATransform3DMakeTranslation(100, 50, 0)
        }
    }
    
    /**
     心跳
     */
    @IBAction func heartClick(_ sender: Any) {
        //创建动画对象
        let anim = CABasicAnimation.init()
        anim.keyPath = "transform.scale"
        anim.toValue = 0
        //设置动画执行次数
        anim.repeatCount = MAXFLOAT
        //设置动画执行时长
        anim.duration = 0.5
        //自动翻转 ，即动画怎么过去 怎么回来
        anim.autoreverses = true
        //添加动画
        self.heartView.layer.add(anim, forKey: nil)
        
    }
    /**
     图标抖动
     */
    @IBAction func iconAnima(_ sender: Any) {
        //c创建帧动画
        let animation = CAKeyframeAnimation.init()
        //设置属性
        animation.keyPath = "transform.rotation"
        //将角度转成弧度
        animation.values = [-5/180.0 * Float.pi,5/180.0 * Float.pi,-5/180.0 * Float.pi]
        animation.repeatCount = MAXFLOAT
        animation.duration = 0.3
//        animation.autoreverses = true
        self.iconView.layer.add(animation, forKey: nil)
        
    }
    /**
     图标根据自定义路径运动
     */
    @IBAction func pahtAnimation(_ sender: UIButton) {
        
        if sender.isSelected {
            //c创建帧动画
            let animation = CAKeyframeAnimation.init()
            //设置属性
            animation.keyPath = "position"
            //圆形路径
            let path = UIBezierPath.init(ovalIn: CGRect(x: 50, y: 150, width: 200, height: 200))
            animation.path = path.cgPath
            animation.repeatCount = MAXFLOAT
            animation.duration = 1
            //        animation.autoreverses = true
            self.iconView.layer.add(animation, forKey: nil)
            
            
            
            
            let animation1 = CAKeyframeAnimation.init()
            animation1.keyPath = "position"
            let path1 = UIBezierPath.init()
            path1.move(to: CGPoint(x: 400, y: 500))
            path1.addLine(to: CGPoint(x: 50, y: 100))
            animation1.path = path1.cgPath
            animation1.repeatCount = MAXFLOAT
            animation1.autoreverses = true
            animation1.duration = 1
            heartView.layer.add(animation1, forKey: nil)
        }else{
            self.iconView.layer.removeAllAnimations()
            self.heartView.layer.removeAllAnimations()
        }

        sender.isSelected = !sender.isSelected
    }
    
}
/**
 时钟 钟表
 */
extension CALyerCtr{
    
    //时钟
    func initClock() {
        //添加时针
        hourLayer = CALayer.init()
        hourLayer.cornerRadius = 4
        hourLayer.backgroundColor = UIColor.black.cgColor
        hourLayer.bounds = CGRect(x: 0, y: 0, width: 4, height: 50)
        hourLayer.position = CGPoint(x: self.clockView.bounds.size.width*0.5, y: self.clockView.bounds.size.height*0.5)
        hourLayer.anchorPoint = CGPoint(x: 0.5, y: 1)//锚点
        self.clockView.layer.addSublayer(hourLayer)
        
        //添加分针
        minLayer = CALayer.init()
        minLayer.cornerRadius = 3
        minLayer.backgroundColor = UIColor.black.cgColor
        minLayer.bounds = CGRect(x: 0, y: 0, width: 3, height: 70)
        minLayer.position = CGPoint(x: self.clockView.bounds.size.width*0.5, y: self.clockView.bounds.size.height*0.5)
        minLayer.anchorPoint = CGPoint(x: 0.5, y: 1)//锚点
        self.clockView.layer.addSublayer(minLayer)
        
        //添加秒针
        clcockLayer = CALayer.init()
        clcockLayer.cornerRadius = 1
        clcockLayer.backgroundColor = UIColor.red.cgColor
        clcockLayer.bounds = CGRect(x: 0, y: 0, width: 1, height: 80)
        clcockLayer.position = CGPoint(x: self.clockView.bounds.size.width*0.5, y: self.clockView.bounds.size.height*0.5)
        clcockLayer.anchorPoint = CGPoint(x: 0.5, y: 1)//锚点
        self.clockView.layer.addSublayer(clcockLayer)
        
        //添加定时器
       time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(clock), userInfo: nil, repeats: true)
    }
    @objc func clock(){
        //秒针旋转
        let canld = Calendar.current
        //日历单元
        let curSecond = canld.component(Calendar.Component.second, from: Date())
        let angle : Float = Float(curSecond) * persencond
        clcockLayer.transform = CATransform3DMakeRotation(CGFloat(angle/180.0*Float.pi), 0, 0, 1)
        
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
