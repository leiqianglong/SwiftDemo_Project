//
//  SpringCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/3/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class SpringCtr: BaseViewController {

    @IBOutlet weak var lbl1: UILabel!
    @IBOutlet weak var lbl2: UILabel!
    @IBOutlet weak var lbl3: UILabel!
    @IBOutlet weak var redCircle: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        redCircle.layer.cornerRadius = 25
        redCircle.clipsToBounds = true
        
        
    }

    @IBAction func startAnimate(_ sender: UIButton) {
        
        redCircle.layer.removeAllAnimations()
        
        // y 方向x
        let springAni = Animate.springAnimationWithPath("position.x", mass: textToCGFloat(text: lbl1.text!), stiffness: textToCGFloat(text: lbl2.text!), damping: textToCGFloat(text: lbl3.text!), fromValue: nil, toValue: UIScreen.main.bounds.width - 25)
        
        //颜色
        //        let springAni = Animate.springAnimationWithPath("backgroundColor", mass: textToCGFloat(text: lbl1.text!), stiffness: textToCGFloat(text: lbl2.text!), damping: textToCGFloat(text: lbl3.text!), fromValue: nil, toValue: UIColor.green.cgColor)
        springAni.isRemovedOnCompletion = false
        springAni.fillMode = kCAFillModeForwards
        
        redCircle.layer.add(springAni, forKey: "positioin.x")
    }
    
    @IBAction func sliderValueChange(_ sender: UISlider) {
        let text = "\(sender.value)"
        if sender.tag == 1 {
            lbl1.text = text
        }else if sender.tag == 2{
            lbl2.text = text
        }else{
            lbl3.text = text
        }
    }
    
    func textToCGFloat(text : String) -> CGFloat {
        return CGFloat((text as NSString).floatValue)
    }

}
