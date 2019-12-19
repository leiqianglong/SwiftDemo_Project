//
//  ScaleCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/3/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class ScaleCtr: BaseViewController {

    
    @IBOutlet weak var imgView1: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         startAnimation()
    }
    func startAnimation(){
        
        //Scale
        let scaleAnimate = Animate.baseAnimationWithKeyPath("transform.scale", fromValue: nil, toValue: 1.2, duration: 0.5, repeatCount: 10, timingFunction: nil)
        scaleAnimate.autoreverses = true
        imgView1.layer.add(scaleAnimate, forKey: "transform.scale")
        
        //Scale
        let scaleXAnimate = Animate.baseAnimationWithKeyPath("transform.scale.x", fromValue: nil, toValue: 2.0, duration: 1.5, repeatCount: Float.infinity, timingFunction: nil)
        scaleXAnimate.autoreverses = true
        imgView2.layer.add(scaleXAnimate, forKey: "transform.scale.x")
        
        //Scale
        let scaleYAnimate = Animate.baseAnimationWithKeyPath("transform.scale.y", fromValue: nil, toValue: 1.5, duration: 1.5, repeatCount: Float.infinity, timingFunction: nil)
        scaleYAnimate.autoreverses = true
        imgView3.layer.add(scaleYAnimate, forKey: "transform.scale.y")
    }

}
