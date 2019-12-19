//
//  ApplaudCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/16.
//  Copyright © 2018年 hou. All rights reserved.
//

//鼓掌动画
import UIKit

class ApplaudCtr: BaseViewController {

    var applauseBtn:UIButton!
    var applauseNumLbl:UILabel!
    var applauseNum:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        setUI()

    }

    private func setUI(){
         //鼓掌按钮
        self.applauseBtn = UIButton(type: UIButtonType.custom)
        self.applauseBtn.frame = CGRect(x: self.view.frame.size.width-15-60, y: self.view.frame.size.height-80-60, width: 60, height: 60)
        self.applauseBtn.setImage(#imageLiteral(resourceName: "applause"), for: UIControlState.normal)
        self.applauseBtn.setImage(#imageLiteral(resourceName: "applause"), for: UIControlState.highlighted)
        self.applauseBtn.addTarget(self, action: #selector(applauseBtnClick), for: UIControlEvents.touchUpInside)
        self.view.addSubview(self.applauseBtn)
        //鼓掌数
        self.applauseNumLbl = UILabel.init(frame: CGRect(x: 6, y: 43, width: 50, height: 12))
        self.applauseNumLbl.textColor = UIColor.white
        self.applauseNumLbl.font = UIFont.systemFont(ofSize: 12)
        self.applauseNumLbl.text = "0"
        self.applauseBtn.addSubview(self.applauseNumLbl)
        self.applauseNumLbl.textAlignment = NSTextAlignment.center
        
    }

   @objc private func applauseBtnClick(){
        self.applauseNum += 1
        self.applauseNumLbl.text = String(self.applauseNum)
    
    
    showTheApplauseInView(view: view, btn: self.applauseBtn)
    
    }
    
    //MARK //鼓掌动画
    func showTheApplauseInView(view:UIView,btn:UIButton) {
        let index:Int = Int(arc4random_uniform(7)) //取随机图片
        let imageStr:String = "applause_" + String(index)
        let applauseView:UIImageView = UIImageView.init(frame: CGRect(x: self.view.frame.size.width-15-50, y: self.view.frame.size.height - 150, width: 40, height: 40))
        view.insertSubview(applauseView, belowSubview: btn)
        applauseView.image = UIImage(named: imageStr)
        
        let AnimH:CGFloat = 350
        applauseView.transform = CGAffineTransform.init(scaleX: 0, y: 0)
        applauseView.alpha = 0
        
        //弹出动画
        UIView.animate(withDuration: 0.2, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.8, options: .curveEaseOut, animations: {
            applauseView.transform = CGAffineTransform.identity
            applauseView.alpha = 0.9
        }) { (_) in
            
        }
        //随机偏转角度
        let i:Int = Int(arc4random_uniform(2))
        let rotationDirection:Double = Double(1 - (2*i))
        let rotationFraction = Double(arc4random_uniform(10))
        //图片在上升过程中旋转
        UIView.animate(withDuration: 4) {
            applauseView.transform = CGAffineTransform.init(rotationAngle: CGFloat(rotationDirection * .pi/(4 + rotationFraction*0.2)))
        }
        
        //动画路径
        let heartTravelPath:UIBezierPath = UIBezierPath()
        heartTravelPath.move(to: applauseView.center)
        
        //随机终点
        let viewX:CGFloat = applauseView.center.x
        let viewY:CGFloat = applauseView.center.y
        let endPoint = CGPoint(x: viewX + CGFloat(rotationDirection*10), y: viewY - AnimH)
        
         //随机control点
        let j:Int = Int(arc4random_uniform(2))
        let travelDirection:Double = Double(1 - (2*j))
        
        let m1 = viewX + CGFloat(travelDirection*Double((arc4random_uniform(20) + 50)))
        let n1 = viewY - CGFloat(60 + travelDirection*Double(arc4random_uniform(20)))
        let m2 = viewX - CGFloat(travelDirection*Double((arc4random_uniform(20) + 50)))
        let n2 = viewY - CGFloat(90 + travelDirection*Double(arc4random_uniform(20)))
        
        let controlPoint1:CGPoint = CGPoint(x: m1, y: n1)
        let controlPoint2:CGPoint = CGPoint(x: m2, y: n2)
        
        heartTravelPath.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        //关键帧动画,实现整体图片位移
        let keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        keyFrameAnimation.path = heartTravelPath.cgPath
        keyFrameAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        keyFrameAnimation.duration = 3
        applauseView.layer.add(keyFrameAnimation, forKey: "positionOnPath")
        //消失动画
        UIView.animate(withDuration: 3, animations: {
            applauseView.alpha = 0.0
        }) { (_) in
            applauseView.removeFromSuperview()
        }
    }
}
