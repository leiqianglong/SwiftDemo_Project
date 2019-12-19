//
//  WheelController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class WheelController: UIViewController {

    var wheelView : WheelView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        wheelView = WheelView.wheelView()
        wheelView.center = view.center
        view.addSubview(wheelView)
    
        let btn = UIButton.init(frame: CGRect(x: 50, y: 100, width: 100, height: 50))
        btn.backgroundColor = UIColor.cyan
        btn.setTitle("开始", for: .normal)
        btn.addTarget(self, action: #selector(start), for: .touchUpInside)
        self.view.addSubview(btn)
        
        let pasbtn = UIButton.init(frame: CGRect(x: 200, y: 100, width: 100, height: 50))
        pasbtn.backgroundColor = UIColor.cyan
        pasbtn.setTitle("暂停", for: .normal)
        pasbtn.addTarget(self, action: #selector(stop), for: .touchUpInside)
        self.view.addSubview(pasbtn)
    }

    @objc func start(){
        wheelView.startAnimi()
    }
    @objc func stop(){
        wheelView.stopAnimi()
    }
}

