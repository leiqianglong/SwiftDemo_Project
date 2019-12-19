//
//  SimplenesCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/2/22.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import SnapKit
import AVFoundation

class SimplenesCtr: BaseViewController {

    var view1 = UIView()
    var view2 = UIView()
    
    var tapOne:UITapGestureRecognizer!

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpUI()

    }

    private func setUpUI(){
        view1 = UIView()
        view1.backgroundColor = UIColor.green
        view.addSubview(view1)
        view1.snp.makeConstraints { (make) in
            make.left.equalTo(self.view)
            make.top.equalTo(self.view)
            make.width.equalTo(KscreenWidth)
            make.height.equalTo(KscreenHeight)
        }
        
        view2 = UIView()
        view2.backgroundColor = UIColor.orange
        view.addSubview(view2)
        view2.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(50)
            make.bottom.equalTo(view).offset(-50)
            make.height.width.equalTo(50)
        }
        tapOne =  UITapGestureRecognizer(target: self, action: #selector(tapOneClick))
        //通过numberOfTouchesRequired属性设置触摸点数，比如设置2表示必须两个手指触摸时才会触发
        tapOne.numberOfTapsRequired = 1
        tapOne.numberOfTouchesRequired = 1
        view2.addGestureRecognizer(tapOne)
        
        let tapSec =  UITapGestureRecognizer(target: self, action: #selector(tapSecClick))
        //通过numberOfTouchesRequired属性设置触摸点数，比如设置2表示必须两个手指触摸时才会触发
        tapSec.numberOfTapsRequired = 1
        tapSec.numberOfTouchesRequired = 1
        view1.addGestureRecognizer(tapSec)
    }
    
    //单击
    @objc func tapOneClick() {
        view.bringSubview(toFront: view1)
        UIView.animate(withDuration: 1, animations: {
            self.view1.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view).offset(50)
                make.bottom.equalTo(self.view).offset(-50)
                make.height.width.equalTo(50)
            })
            self.view2.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view)
                make.top.equalTo(self.view)
                make.width.equalTo(KscreenWidth)
                make.height.equalTo(KscreenHeight)
            })
            self.view.layoutIfNeeded()
        }, completion: { (_) in
            
        })
    }
    @objc func tapSecClick(){
        self.view.bringSubview(toFront: self.view2)
        UIView.animate(withDuration: 1, animations: {
            self.view1.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view)
                make.top.equalTo(self.view)
                make.width.equalTo(KscreenWidth)
                make.height.equalTo(KscreenHeight)
            })
            self.view2.snp.remakeConstraints({ (make) in
                make.left.equalTo(self.view).offset(50)
                make.bottom.equalTo(self.view).offset(-50)
                make.height.width.equalTo(50)
            })
            self.view.layoutIfNeeded()
        }, completion: { (_) in
            
        })
    }

}
