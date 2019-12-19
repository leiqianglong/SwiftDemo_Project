//
//  CustomNotiController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class CustomNotiController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "自定义"
        
    }

    let size:CGSize = UIScreen.main.bounds.size
    
     //1.top (顶部)
    @IBAction func one(_ sender: Any) {
        let cust1 = Bundle.main.loadNibNamed("CustomView1", owner: self, options: nil)?.last as? CustomView1
        let cb = EBCustomBannerView.showCustomView(cust1) { (make) in
            make?.portraitFrame = CGRect(x: 0, y: 0, width: self.size.width, height: 94)
            make?.portraitMode = EBCustomViewAppearModeTop
            make?.soundID = 1312
            make?.stayDuration = 3.0
        }
        cust1?.customView = cb

    }
     //2.left (左侧)
    @IBAction func sec(_ sender: Any) {
        let cust2 = Bundle.main.loadNibNamed("CustomView2", owner: self, options: nil)?.last as? CustomView2
        let cb = EBCustomBannerView.showCustomView(cust2) { (make) in
            make?.portraitFrame = CGRect(x: 0, y: 50, width:300, height: 500)
            make?.portraitMode = EBCustomViewAppearModeLeft
            make?.soundID = 1312
            make?.stayDuration = 3.0
        }
        cust2?.customView = cb
    }
     //3.right (右侧)
    @IBAction func tre(_ sender: Any) {
        let cust3 = Bundle.main.loadNibNamed("CustomView2", owner: self, options: nil)?.last as? CustomView2
        let cb = EBCustomBannerView.showCustomView(cust3) { (make) in
            make?.portraitFrame = CGRect(x: 1000, y: 50, width:300, height: 500)
            make?.portraitMode = EBCustomViewAppearModeRight
            make?.soundID = 0
            make?.stayDuration = 3.0
        }
        cust3?.customView = cb
    }
    //4.bottom (底侧)
    @IBAction func four(_ sender: Any) {
        let cust4 = Bundle.main.loadNibNamed("CustomView1", owner: self, options: nil)?.last as? CustomView1
        let cb = EBCustomBannerView.showCustomView(cust4) { (make) in
            make?.portraitFrame = CGRect(x: 0, y: 500, width: self.size.width, height: 94)
            make?.portraitMode = EBCustomViewAppearModeBottom
            make?.soundID = 1312
            make?.stayDuration = 3.0
        }
        cust4?.customView = cb
    }
    //5.center (中间)
    @IBAction func five(_ sender: Any) {
        let cust5 = Bundle.main.loadNibNamed("CustomView3", owner: self, options: nil)?.last as? CustomView3
        let cb = EBCustomBannerView.showCustomView(cust5) { (make) in
            make?.portraitFrame = UIScreen.main.bounds
            make?.portraitMode = EBCustomViewAppearModeCenter
        }
        cust5?.customView = cb
    }
     //6.diff in portrait/landscape (横竖屏不同)
    @IBAction func six(_ sender: Any) {
        let cust6 = Bundle.main.loadNibNamed("CustomView3", owner: self, options: nil)?.last as? CustomView3
        let cb = EBCustomBannerView.showCustomView(cust6) { (make) in
            let size = UIScreen.main.bounds.size
            var frame = CGRect(x: 0, y: 0, width: 230, height: 120)
            frame.origin.x = size.width * 0.5 - 230*0.5
            frame.origin.y = size.width * 0.5 - 120*0.5
            make?.portraitFrame = frame
            make?.portraitMode = EBCustomViewAppearModeCenter
            frame.origin.x = size.height * 0.5 - 230*0.5
            frame.origin.y = size.height * 0.5 - 120*0.5
            make?.landscapeFrame = frame
            make?.portraitMode = EBCustomViewAppearModeLeft
            make?.landscapeMode = EBCustomViewAppearModeCenter
        }
        cust6?.customView = cb
        
    }
    
}
