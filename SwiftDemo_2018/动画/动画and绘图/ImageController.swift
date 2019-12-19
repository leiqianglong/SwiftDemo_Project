//
//  ImageController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/7.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class ImageController: UIViewController {

    var myImageView:MyImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myImageView = MyImageView.init(frame: CGRect(x: 0, y: 64, width: 100, height: 100))
        myImageView.image = UIImage(named: "icon1")
        self.view.addSubview(myImageView)
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.myImageView.image = UIImage(named: "icon2")
    }
}
