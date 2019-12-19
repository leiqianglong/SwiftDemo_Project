//
//  BaseTabBarController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/20.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //初始化子控制器
        setUpUi()
    }

    func setUpUi() {

        let firstVc = FirstViewController()
        let anim = AnimationController(style: UITableViewStyle.plain)
        let mineVc = SecondController()
        
        setUpChildViewController(childVC: firstVc, image: "applause_0", selectImage: "applause_0", title: "首页")
        setUpChildViewController(childVC: anim, image: "applause_0", selectImage: "applause_0", title:"动画")
        setUpChildViewController(childVC: mineVc, image: "applause_0", selectImage: "applause_0", title: "音视频")

        
    }
    //初始化字控制器
    func setUpChildViewController(childVC : UIViewController,image:String,selectImage:String,title:String) {
        childVC.title = title
        childVC.tabBarItem.image = UIImage(named: image)
        childVC.tabBarItem.selectedImage = UIImage(named:selectImage)
        let nav = BaseNavaController(rootViewController: childVC)
        addChildViewController(nav)
    }
}
