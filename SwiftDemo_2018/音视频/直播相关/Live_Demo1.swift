//
//  Live_Demo1.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/15.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import SDAutoLayout

class Live_Demo1: BaseViewController {

    var car:CarImageView!
    var plane:PlaneView!
    
    let PhoneScreen_WIDTH = UIScreen.main.bounds.size.width
    let PhoneScreen_HEIGHT = UIScreen.main.bounds.size.height
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "跑车动画"

        //加载跑车
        loadCustomCarImageView()
        //加载战斗机
        loadPlaneView()
        // 设置一排固定间距自动宽度子view
        setupAutoWidthViewsWithCount(count: 3, margin: 10)
        
    
    }

    @objc func btnClick(btn:UIButton) {
       
        switch btn.tag {
        case 0:
            kaifeiche()
            break
        case 1:
            plane.startAnimation()
            break
        case 2:
             car.startAnimation()
            break
        default:
           
            break
        }
    }
    
    
    func loadPlaneView() {
        plane = PlaneView.init(planeView: ())
          //开始位置
        plane.startPoint = CGPoint(x: PhoneScreen_WIDTH, y: 0)
        
         //展示时的位置，从右向屏幕中间飞，途径的点
        let onePoint:NSValue = NSValue(cgPoint: CGPoint(x: PhoneScreen_WIDTH-30, y: 50))
        let twoPoint:NSValue = NSValue(cgPoint: CGPoint(x: PhoneScreen_WIDTH*0.5 + 50, y: PhoneScreen_HEIGHT*0.5-90))
        //展示的位置
        plane.showPointArray = [onePoint,twoPoint]
         //展示时每一帧的时间，0-1之间
        plane.showTimeArray = [0,0.15,0.5,1.0]
        
         //飞机离开时的，从屏幕中部向屏幕左侧飞
        let oneLeavePoint:NSValue = NSValue(cgPoint: CGPoint(x: PhoneScreen_WIDTH*0.5-150, y: PhoneScreen_HEIGHT*0.5))
        let twoLeavePoint:NSValue = NSValue(cgPoint: CGPoint(x: -200, y:PhoneScreen_HEIGHT*0.5+100))
         //飞机位置
        plane.leavePointArray = [oneLeavePoint,twoLeavePoint]
        plane.leaveTimeArray = [0,0.5,1.0]
      //飞机的初始位置，屏幕右侧
        plane.startPoint = CGPoint(x: PhoneScreen_WIDTH, y: 0)
         plane.stayPoint = CGPoint(x: PhoneScreen_WIDTH*0.5, y: PhoneScreen_HEIGHT*0.5-70)
        
         //飞机出场时间（从最右侧到屏幕中央的时间）
        plane.showDuration = 3.0
        //飞机里长时间（从屏幕中央到最左侧的时间）
        plane.leaveDuration = 2.0
        //爆炸的时间，也是飞机在屏幕中央停留的时间
        plane.boomDuration = 3.0
        view.addSubview(plane)
        
    }
    
    func loadCustomCarImageView() {
         //跑车位置
        car = CarImageView.init(carImageViewWithOriginCenter: CGPoint(x: -240, y: 0))
        //跑车开始动画的位置
        car.startAnimatePoint = CGPoint(x: 0, y: 100)
        //跑车结束动画的位置
        car.endAnimatePoint = CGPoint(x: 600, y: 500)
        //跑车的尺寸大小
        car.controlScaleArray = ["0.5","1","1.2"]
        //跑车途径的点
        let onePoint:NSValue = NSValue(cgPoint: CGPoint(x: 120, y: 150))
        let twoPoint:NSValue = NSValue(cgPoint: CGPoint(x: 180, y: 210))
        let threePoint:NSValue = NSValue(cgPoint: CGPoint(x: 240, y: 260))
        car.controlPointArray = [onePoint,twoPoint,threePoint]

         //移动时的帧动画时间
        car.pointTimeArray = [0,0.15,0.45,0.7,0.85,1]
         //尺寸的帧动画时间
        car.scaleTimeArray = [0,0.15,0.45,1]
        //整个动画的时间
        car.animateDuration = 5.0
        view.addSubview(car)
    }
    
    
    
    func kaifeiche() {
//        let KScreenw = UIScreen.main.bounds.size.width
//        let KScreenH = UIScreen.main.bounds.size.height
        
        let dur = 1.5
        let car = UIImageView(image: UIImage(named:"porsche"))
        
        car.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        view.addSubview(car)
        
        let widthCar:CGFloat = 260
        let heightCar:CGFloat = 130
        
        UIView.animate(withDuration: dur) {
            car.frame = CGRect(x: self.view.center.x - widthCar*0.5, y: self.view.center.y - heightCar*0.5, width: widthCar, height: heightCar)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+dur) {
            UIView.animate(withDuration: dur, animations: {
                car.alpha = 0
            }, completion: { (_) in
                car.removeFromSuperview()
            })
        }
        
        
    }

    func setupAutoWidthViewsWithCount(count:Int,margin:CGFloat) -> Void {
        
        let btnView = UIView()
        btnView.backgroundColor = UIColor.orange
        view.addSubview(btnView)
        
        var titles = [String]()
        titles.append("飞车")
        titles.append("战斗机")
        titles.append("跑车")
        
        var temp = Array<UIButton>()
        
        for i in 0..<count {
            let btn = UIButton(type: UIButtonType.custom)
            btn.backgroundColor = UIColor.gray
            btnView.addSubview(btn)
            btn.setTitle(titles[i], for: UIControlState.normal)
            btn.sd_layout().autoHeightRatio(0.4)
            temp.append(btn)
            btn.tag = i
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        }
        btnView.sd_layout().leftSpaceToView(view,10)?.rightSpaceToView(view,10)?.bottomSpaceToView(view,10)?.heightIs(80.0)
        
        btnView.setupAutoWidthFlowItems(temp, withPerRowItemsCount: 3, verticalMargin: margin, horizontalMargin: margin, verticalEdgeInset: 5, horizontalEdgeInset: 10)
    }

}
