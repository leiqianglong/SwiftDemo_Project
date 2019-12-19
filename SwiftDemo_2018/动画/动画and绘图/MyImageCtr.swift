//
//  MyImageCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/7.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class MyImageCtr: UIViewController {

    @IBOutlet weak var iamgeview3: UIImageView!
    @IBOutlet weak var iamgeview2: UIImageView!
    @IBOutlet weak var iamgeview: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        test1()
        test2()
        test3()
    }

    //给图片打水印
    private func test1(){
        let str:NSString = "我是水印文字"
        //生成图片
        let image = UIImage(named: "profile_cover_background")
        //size:要开启多大的上下文,多大的图片
        //opaque:不透明度
        //scale:缩放上下文
        UIGraphicsBeginImageContextWithOptions((image?.size)!, false, 0.0)
        image?.draw(at: CGPoint.zero)
        //开始绘制文字
        let dic:NSDictionary = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20),
                   NSAttributedStringKey.foregroundColor:UIColor.white.cgColor]
        str.draw(at: CGPoint(x: (image?.size.width)!-150, y: (image?.size.height)!-50), withAttributes: (dic as! [NSAttributedStringKey : Any]))
        //生成图片
        let img = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        
        self.iamgeview.image = img
    }

    //裁剪圆形头像
    private func test2(){
        let image = UIImage(named: "icon2")
        UIGraphicsBeginImageContextWithOptions((image?.size)!, false, 0.0)
        
        let path = UIBezierPath.init(ovalIn: CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!))

         //把路径设置为 裁剪区域
        path.addClip()
        image?.draw(at: CGPoint.zero)
        //生成图片
        let img = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        self.iamgeview2.image = img
    }
    
    //裁剪带边框的圆形图片
    private func test3(){
         let image = UIImage(named: "icon2")
        //边框宽度
        let borderW:CGFloat = 10.0
        //开启上下文
        let size:CGSize = CGSize(width: (image?.size.width)! + 2*borderW, height: (image?.size.height)! + 2*borderW)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        //描述路径 大圆 填充样式
        var path = UIBezierPath.init(ovalIn: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        UIColor.red.set()
        path.fill()
        //添加小圆 裁剪区域
        path = UIBezierPath.init(ovalIn: CGRect(x: borderW, y: borderW, width: (image?.size.width)!, height: (image?.size.height)!))
        path.addClip()
        //把图片绘制到上下文
        image?.draw(in:CGRect(x: 0, y: 0, width: size.width, height: size.height))
        //生成图片
         let img = UIGraphicsGetImageFromCurrentImageContext()
        //关闭上下文
        UIGraphicsEndImageContext()
        self.iamgeview3.image = img
    }
}






