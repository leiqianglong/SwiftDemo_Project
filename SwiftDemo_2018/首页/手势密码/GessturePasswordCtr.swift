//
//  GessturePasswordCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/20.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class GessturePasswordCtr: BaseViewController {

    var gestureViewOriginX : CGFloat = kScreenH
    
    //手势密码
    var gesturePsdView : GessturePasswordView? = {

        let gesturePsdView : GessturePasswordView = GessturePasswordView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH))
        gesturePsdView.window?.windowLevel = gesturePasswordViewLevel
        
        return gesturePsdView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setPassWord()

    }

    @IBAction func setPassWord() {
        view.addSubview(gesturePsdView!)
        UIApplication.shared.keyWindow?.addSubview(gesturePsdView!)
        self.gesturePsdView?.frame = CGRect(x: 0, y: gestureViewOriginX, width: kScreenW, height: kScreenH)
        UIView.animate(withDuration: 0.3, animations: {
            self.gesturePsdView?.frame = CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH)
        }) { (finished) in
            
        }
    }
    
    @IBAction func newPassWord(_ sender: UIButton) {
        SettingManager.clearGesturePassword()
        setPassWord()
    }
    
}
