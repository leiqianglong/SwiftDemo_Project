//
//  BaseViewController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/15.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        
    }
    
    func hideKeyboard(){
        self.view.endEditing(true)
        viewTransformY(0)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hideKeyboard()
    }
    func viewTransformY(_ y : Float){
        UIView.animate(withDuration: 0.2, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.view.transform = CGAffineTransform(translationX: 0, y: CGFloat(y))
        }, completion: nil)
    }
}
