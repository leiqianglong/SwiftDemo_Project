//
//  InvertedPicCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class InvertedPicCtr: UIViewController {
    @IBOutlet weak var iamgeview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()


       
        let replayer = self.view.layer as! CAReplicatorLayer
        replayer.instanceCount = 2
        replayer.instanceTransform = CATransform3DMakeRotation(CGFloat(Float.pi), 1, 0, 0)
        replayer.instanceRedOffset -= 0.1
        replayer.instanceGreenOffset -= 0.1
        replayer.instanceBlueOffset -= 0.1
        replayer.instanceAlphaOffset -= 0.1
    }

   

}
