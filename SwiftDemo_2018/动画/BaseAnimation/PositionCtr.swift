//
//  PositionCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/3/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class PositionCtr: BaseViewController {
    @IBOutlet weak var positionImage: UIImageView!
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var text3: UITextField!
    @IBOutlet weak var text4: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       title = "Position"
        
    }

    @IBAction func startButton(_ sender: Any) {
        hideKeyboard()
        
        positionImage.layer.removeAllAnimations()
        
        let pX  = (text1.text! as NSString).doubleValue
        let pY  = (text2.text! as NSString).doubleValue
        let anchorX = (text3.text! as NSString).doubleValue
        let anchorY = (text4.text! as NSString).doubleValue

        let animate = Animate.baseAnimationWithKeyPath("position", fromValue: NSValue(cgPoint: CGPoint(x: 0, y: 100)), toValue: NSValue(cgPoint: CGPoint(x: pX, y: pY)), duration: 1.5, repeatCount: Float.infinity, timingFunction: kCAMediaTimingFunctionEaseOut)
        animate.autoreverses = true
        
        positionImage.layer.anchorPoint = CGPoint(x: anchorX, y: anchorY)
        
        positionImage.layer.add(animate, forKey: "position")
        
        
    }
    
}
