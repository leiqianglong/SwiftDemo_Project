//
//  ScreenImgController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/8.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class ScreenImgController: UIViewController {

    @IBOutlet weak var imagView: UIImageView!
    var startp:CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "裁剪图片"
    }

    lazy var clipView:UIView = {
        let v = UIView()
        v.backgroundColor = UIColor.black
        v.alpha = 0.6
        view.addSubview(v)
        return v
    }()
    
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        //获取当前手指所在点
        let curp:CGPoint = sender.location(in: self.view)
        if sender.state == .began { //手指开始
            startp = curp
            self.view.addSubview(clipView)
        }else if sender.state == .changed{//手指改变
            let offsetx = curp.x - startp.x
            let offsety = curp.y - startp.y
            let rect = CGRect(x: startp.x, y: startp.y, width: offsetx, height: offsety)
            self.clipView.frame = rect
        }else if sender.state == .ended{//手指停止
            
            UIGraphicsBeginImageContextWithOptions(self.imagView.bounds.size, false, 0.0)
            //设置裁剪区域
            let path = UIBezierPath.init(rect: self.clipView.frame)
            path.addClip()//设置为裁剪路径
            //获取当前上下文
            let ctx = UIGraphicsGetCurrentContext()
            
            self.imagView.layer.render(in: ctx!)
            //生成一张图片
            let newImg = UIGraphicsGetImageFromCurrentImageContext()
            self.imagView.image = newImg
            //移除区域view
            self.clipView.removeFromSuperview()
            UIGraphicsEndImageContext()
        }
    }
}
