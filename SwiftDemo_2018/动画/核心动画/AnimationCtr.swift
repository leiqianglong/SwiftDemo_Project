//
//  AnimationCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

/**
 转场动画
 */
import UIKit

class AnimationCtr: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var i = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    //用view 自带转场动画
    @IBAction func viewanimation(_ sender: UIButton) {
        
        UIView.transition(with: self.imageView, duration: 1, options: UIViewAnimationOptions.transitionCurlUp, animations: {
 
            self.i += 1
            if self.i > 4 {
                self.i = 0
            }
            self.imageView.image = UIImage(named: "test" + "\(self.i)")
            
            
        }) { (_) in
            
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        i += 1
        if i > 4 {
            i = 0
        }
        self.imageView.image = UIImage(named: "test" + "\(i)")
        
        //创建动画
        let anim = CATransition.init()
        //转场类型
        anim.type = "rippleEffect"
        anim.duration = 0.5
        //设置专场动画方向
        anim.subtype = kCATransitionFromTop
        //设置动画开始点
        anim.startProgress = 0.3
        //设置动画结束点
        anim.endProgress = 0.9
        self.imageView.layer.add(anim, forKey: nil)
        
        
        ///注意 ！！！
        ///转场动画代码 必须 要和 转场代码 放在同一个方法中，否则无效
        
        /**
         fade 交叉淡化过渡
         push 新视图把旧视图推出去
         moveIn 新视图移到旧视图上面
         reveal将旧视图移开,显示下面的新视图
         cube立方体翻滚效果
         oglFlip上下左右翻转效果
         suckEffect收缩效果，如一块布被抽走
         rippleEffect 水滴效果
         pageCurl 向上翻页效果
         pageUnCurl 向下翻页效果 cameraIrisHollowOpen 相机镜头打开效果
         cameraIrisHollowClose 相机镜头关闭效果
 
         */
    }

}
