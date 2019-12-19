//
//  GranuleController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class GranuleController: UIViewController {

    @IBOutlet var myview: DrawLineView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func start(_ sender: Any) {
        myview.start()
    }
    @IBAction func draw(_ sender: Any) {
        myview.reDraw()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
