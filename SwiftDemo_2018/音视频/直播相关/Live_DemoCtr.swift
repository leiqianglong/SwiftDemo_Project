//
//  Live_DemoCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/17.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit


class Live_DemoCtr: BaseViewController {

    var flower:NHPresentFlower?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

  
    //保时捷
    @IBAction func baoshijie(_ sender: Any) {
        let car = NHCarViews.loadCarView(with: CGPoint.zero)
        var pointArrs:Array = [Any]()
        let width = UIScreen.main.bounds.size.width * 0.5
        pointArrs.append(NSStringFromCGRect(CGRect(x: width, y: 300, width: width, height: 300)))
        car?.curveControlAndEndPoints = pointArrs
        car?.addAnimationsMove(to: CGPoint(x: 0, y: 100), end: CGPoint(x: self.view.bounds.size.width + 166, y: 500))
        view.addSubview(car!)
    }
    //歼灭者
    @IBAction func jianmiezhe(_ sender: Any) {
        let fighter = NHFighterView.load(with: CGPoint(x: 10, y: 100))
        fighter?.addAnimationsMove(to: CGPoint(x:self.view.bounds.size.width,y:60), end: CGPoint(x:-500,y:600))
        view.addSubview(fighter!)
    }
    //客机
    @IBAction func keji(_ sender: Any) {
        let plane = NHPlaneView.load(with: CGPoint(x: UIScreen.main.bounds.size.width+232, y: 0))
        plane?.addAnimationsMove(to: CGPoint(x:UIScreen.main.bounds.size.width,y:100), end: CGPoint(x:-500,y:410))
        view.addSubview(plane!)
    }
    
    @IBAction func xianhua1(_ sender: Any) {
        if flower == nil {
            addFlowerView()
        }else{
            flower?.effect = NHSendEffect.spring
            flower?.continuePresentFlowers()
        }
    }
    
    @IBAction func xianhua2(_ sender: Any) {
        if flower == nil {
            addFlowerView()
        }else{
            flower?.effect = NHSendEffect.shake
            flower?.continuePresentFlowers()
        }
    }
    
    func addFlowerView() {
        let rect = CGRect(x: 0, y: 200, width: self.view.bounds.size.width, height: 50)
        let flowers = NHPresentFlower.init(frame: rect, presentFlower: NHSendEffect.shake)
        flowers?.autoHiddenTime = 5
        view.addSubview(flowers!)
        flower = flowers
    }
    
}
