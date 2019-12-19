//
//  SizeCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/3/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class SizeCtr: BaseViewController {

    @IBOutlet weak var boundsImg: UIImageView!
    @IBOutlet weak var contentsW: UIImageView!
    @IBOutlet weak var contentH: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimation()
    }
    func startAnimation(){
        //bounds
        let boundsAnimate = Animate.baseAnimationWithKeyPath("bounds", fromValue: nil, toValue: NSValue(cgRect: CGRect(x: 0, y: 0, width: 50, height: 50)), duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        boundsAnimate.autoreverses = true
        boundsImg.layer.add(boundsAnimate, forKey: "bounds")
        
        //contentsRect.size.width
        let widthAnimate = Animate.baseAnimationWithKeyPath("contentsRect.size.width", fromValue: nil, toValue: 0.5, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        widthAnimate.autoreverses = true
        contentsW.layer.add(widthAnimate, forKey: "contentsRect.size.width")
        
        //contentsRect.size.height
        let heightAnimate = Animate.baseAnimationWithKeyPath("contentsRect.size.height", fromValue: nil, toValue: 1.5, duration: 0.75, repeatCount: Float.infinity, timingFunction: nil)
        heightAnimate.autoreverses = true
        contentH.layer.add(heightAnimate, forKey: "contentsRect.size.height")
    }


}
