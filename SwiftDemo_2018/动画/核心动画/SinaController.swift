//
//  SinaController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/11.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class SinaController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        let vi = UIView.init(frame: CGRect(x: 100, y: 100, width: 50, height: 100))
        vi.backgroundColor = UIColor.brown
        var tras = vi.transform
         tras = tras.rotated(by: 3.14/4)
        view.addSubview(vi)
        vi.transform = tras
        
        
    }

    @IBAction func itemBtnClick(_ sender: UIButton) {
        let vc = SinaPopController()
        self.present(vc, animated: true, completion: nil)
    }


}
