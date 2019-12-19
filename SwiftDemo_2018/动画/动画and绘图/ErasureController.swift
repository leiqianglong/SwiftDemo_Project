//
//  ErasureController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/8.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class ErasureController: UIViewController {

    @IBOutlet weak var bgImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        //添加手势
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(pan(pan:)))
        self.bgImageView.addGestureRecognizer(pan)
  
    }


    @objc private func pan(pan:UIPanGestureRecognizer){
        //获取当前手指所在点
        let curp:CGPoint = pan.location(in: self.bgImageView)
        let rectWH:CGFloat = 30.0
        let x = curp.x - rectWH*0.5
        let y = curp.y - rectWH*0.5
        //擦除区域
        let clipRect = CGRect(x: x, y: y, width: rectWH, height: rectWH)
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(self.bgImageView.bounds.size, false, 0)
        let ctx = UIGraphicsGetCurrentContext()
        self.bgImageView.layer.render(in: ctx!)
       
        //擦除
        ctx?.clear(clipRect)
        let newimg = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        self.bgImageView.image = newimg
    }

}
