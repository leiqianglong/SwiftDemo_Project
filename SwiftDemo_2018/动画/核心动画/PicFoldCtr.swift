//
//  PicFoldCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class PicFoldCtr: UIViewController {

    @IBOutlet weak var dragView: UIView!
    @IBOutlet weak var topimageview: UIImageView!
      @IBOutlet weak var botomimageview: UIImageView!
    
    var caglayer:CAGradientLayer!
    override func viewDidLoad() {
        super.viewDidLoad()

        // 上部分图片只显示上半部分
        //让现实某一块区域
        self.topimageview.layer.contentsRect = CGRect(x: 0, y: 0, width: 1, height: 0.5)
        self.botomimageview.layer.contentsRect = CGRect(x: 0, y: 0.5, width: 1, height: 0.5)
        self.topimageview.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
        self.botomimageview.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(dragviewPan(pan:)))
        dragView.addGestureRecognizer(pan)
        
        //给底部图片添加渐变色
        //渐变层CAGradientLayer
         caglayer = CAGradientLayer.init()
         caglayer.frame = self.botomimageview.bounds
         caglayer.colors = [UIColor.clear.cgColor,UIColor.black.cgColor]
        //改变渐变方向
         caglayer.startPoint = CGPoint(x: 0, y: 0)
         caglayer.endPoint = CGPoint(x: 0, y: 1)
         caglayer.opacity = 0 //透明度
        //颜色渐变位置
         caglayer.locations = [0.3,0.7]
         self.botomimageview.layer.addSublayer(caglayer)
    }

    @objc func dragviewPan(pan:UIPanGestureRecognizer){
        //拖动距离
        let transp = pan.translation(in: self.dragView)
        
        var trans3d = CATransform3DIdentity
        
        caglayer.opacity = Float(transp.y * 1 / self.dragView.frame.size.height)
        
        //修改此值会有立体效果 近大远小
        trans3d.m34 = -1 / 400.0
        
        let angle:CGFloat = transp.y*CGFloat(Float.pi) / self.dragView.frame.size.height
        //上半部分图片做旋转
        self.topimageview.layer.transform = CATransform3DRotate(trans3d, -angle, 1, 0, 0)

        //让图片反弹回去复位
        if pan.state == .ended{
            caglayer.opacity = 0
            ///usingSpringWithDamping 弹性系数 值越小 弹性越大
            ///initialSpringVelocity 弹簧初试系数
            ///curveLinear 匀速
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.25, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveLinear, animations: {
                self.topimageview.layer.transform = CATransform3DIdentity
            }) { (_) in
                
            }
        }
    }


}
