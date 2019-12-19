//
//  RotationCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/3/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class RotationCtr: BaseViewController {

    @IBOutlet weak var rotationImage: UIImageView!
    @IBOutlet weak var textX: UITextField!
    
    @IBOutlet weak var textY: UITextField!
        
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Rotation"
 
    }

    @IBAction func rotationX(_ sender: Any) {
        rotationImage.layer.removeAllAnimations()
        let animate = Animate.baseAnimationWithKeyPath("transform.rotation.x", fromValue: nil , toValue: 2 * Double.pi, duration: 1.0, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionLinear)
        rotationImage.layer.add(animate, forKey: "transform.rotation.x")
    }
    
    @IBAction func rotationY(_ sender: Any) {
        rotationImage.layer.removeAllAnimations()
        let animate = Animate.baseAnimationWithKeyPath("transform.rotation.y", fromValue: nil , toValue: 2 * Double.pi, duration: 1.0, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionEaseIn)
        rotationImage.layer.add(animate, forKey: "transform.rotation.y")
    }
    
    @IBAction func rotationZ(_ sender: Any) {
        rotationImage.layer.removeAllAnimations()
        let animate = Animate.baseAnimationWithKeyPath("transform.rotation.z", fromValue: nil , toValue: 2 * Double.pi, duration: 1.0, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionEaseOut)
        rotationImage.layer.add(animate, forKey: "transform.rotation.z")
    }
    //    自定义XY
    @IBAction func customRotation(_ sender: Any) {
        let x : Double = (textX.text! as NSString).doubleValue
        let y : Double = (textY.text! as NSString).doubleValue
        rotationImage.layer.anchorPoint = CGPoint(x: x, y: y)
        rotationImage.layer.removeAllAnimations()
        let animate = Animate.baseAnimationWithKeyPath("transform.rotation.z", fromValue: nil , toValue: 2 * Double.pi, duration: 1.0, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionLinear)
        rotationImage.layer.add(animate, forKey: "transform.rotation.z")
    }
    
}
