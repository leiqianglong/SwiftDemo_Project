//
//  PushAnimationController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/12.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class PushAnimationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.randomColor()
        //重写导航栏返回按钮
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .plain, target: self, action: #selector(back))
        
        let imgv = UIImageView.init(frame: self.view.bounds)
        imgv.contentMode = UIViewContentMode.scaleAspectFit
        imgv.image = UIImage(named: "icon-MV_Smile")
        view.addSubview(imgv)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        let anim = CATransition.init()
        anim.duration = 1
        anim.type = "pageUnCurl"
        anim.subtype = kCATransitionFromLeft
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.navigationController?.view.layer.add(anim, forKey: nil)
      
        let vc = PushAnimationController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func back(){
        let anim = CATransition.init()
        anim.duration = 1
        anim.type = "rippleEffect"
        anim.subtype = kCATransitionFromTop
        anim.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.navigationController?.view.layer.add(anim, forKey: nil)
        
        self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
