//
//  ForgetGesturePasswordView.swift
//  HiWallet
//
//  Created by liuchunchao on 2017/12/20.
//  Copyright © 2017年 HiWallet. All rights reserved.
//

import UIKit

class ForgetGesturePasswordView: UIView {

    //是否显示指纹解锁
    var isShowIDunlock : Bool = false{
        didSet{
    
                forgetPsdButton.removeFromSuperview()
                addSubview(forgetPsdButton)
            
         
                forgetPsdButton.frame = CGRect(x: (kScreenW - SP6(x: 120))/2, y: 0, width: SP6(x: 120), height: self.height())
                forgetPsdButton.contentHorizontalAlignment = .center
        }
    }
    //忘记手势密码
    lazy var forgetPsdButton : UIButton = {
        let forgetPsdButton : UIButton = UIButton()
     
      forgetPsdButton.setTitle("忘记手势密码", for: .normal)
      forgetPsdButton.setTitleColor(UIColor.colorWithHexString(hex: lightGray), for: .normal)
      forgetPsdButton.titleLabel?.font = UIFont.systemFont(ofSize: SP6(x: 15))
        return forgetPsdButton
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}



