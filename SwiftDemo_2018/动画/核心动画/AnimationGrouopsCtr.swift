//
//  AnimationGrouopsCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class AnimationGrouopsCtr: UIViewController {

    /**
     UIView动画 和 核心动画的区别？
     1.核心动画只作用在layer上
     2.核心动画修改的值都是假象，他的真实位置没有发生变化

     当需要与用户交互的时候 ----> 使用UIView动画
     当不需要与用户交互的时候 ---> 两个都可以
     
     做转场动画、帧动画、动画组的时候 使用 核心动画更多
     
     */

    @IBOutlet weak var aniamView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

   
    }


    ///动画组
    @IBAction func groupAnimation(_ sender: UIButton) {

        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            //缩放
            let anim = CABasicAnimation.init()
            anim.keyPath = "transform.scale"
            anim.toValue = 0.5
            //动画完成 不要删除动画
            //        anim.isRemovedOnCompletion = false
            //        anim.fillMode = kCAFillModeForwards
            //        self.aniamView.layer.add(anim, forKey: nil)
            //平移
            let anim1 = CABasicAnimation.init()
            anim1.keyPath = "position.y"
            anim1.toValue = 400
            //        anim1.isRemovedOnCompletion = false
            //        anim1.fillMode = kCAFillModeForwards
            //        self.aniamView.layer.add(anim1, forKey: nil)
            ///组动画
            let group = CAAnimationGroup.init()
            group.animations = [anim,anim1]
            group.isRemovedOnCompletion = false
            group.fillMode = kCAFillModeForwards
            self.aniamView.layer.add(group, forKey: nil)
        }else{
            //缩放
            let anim = CABasicAnimation.init()
            anim.keyPath = "transform.scale"
            anim.toValue = 1
            //平移
            let anim1 = CABasicAnimation.init()
            anim1.keyPath = "position.y"
            anim1.toValue = 150
            ///组动画
            let group = CAAnimationGroup.init()
            group.animations = [anim,anim1]
            group.isRemovedOnCompletion = false
            group.fillMode = kCAFillModeForwards
            self.aniamView.layer.add(group, forKey: nil)
        }
       
    }
}
