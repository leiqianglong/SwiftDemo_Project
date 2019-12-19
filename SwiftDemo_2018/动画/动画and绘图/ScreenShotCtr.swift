//
//  ScreenShotCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/8.
//  Copyright © 2019 hou. All rights reserved.
//

/***
 截屏
 */
import UIKit

class ScreenShotCtr: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //截屏按钮点击
    @IBAction func screenShotClick(_ sender: UIButton) {
        //开启上下文
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 0.0)
        //获取当前上下文
        let ctx = UIGraphicsGetCurrentContext()
        //view 之所以能显示 是因为内部有个层 layer 层是通过渲染的方式绘制上去
        view.layer.render(in: ctx!)
        //生成一张新的图片
        let newImg = UIGraphicsGetImageFromCurrentImageContext()
  
        let imgData =  UIImageJPEGRepresentation(newImg!, 1.0)

        do {
            //路径前面必须要加 file:// 才能写入成功
            try imgData?.write(to: URL(string: "file:///Users/hou/Desktop/screen.jpg")!, options: Data.WritingOptions.atomic)
        } catch  {
             print("写入缓存数据失败")
        }

        //关闭上下文
        UIGraphicsEndImageContext()
        
    }
    
    @IBAction func clipImage(_ sender: UIButton) {
        if sender.tag == 1 {
            let vc = ScreenImgController()
            self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 2 {
            let vc = ErasureController()
            self.navigationController?.pushViewController(vc, animated: true)
        }

    }
    
}
