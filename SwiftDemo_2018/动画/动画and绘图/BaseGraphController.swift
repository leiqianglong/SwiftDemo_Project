//
//  BaseGraphController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/7.
//  Copyright © 2019 hou. All rights reserved.
//

/**
 基本图形绘制
 */
import UIKit

class BaseGraphController: UIViewController {

  @IBOutlet weak var valueLab: UILabel!
  @IBOutlet weak var progressView: ProgressView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "画图"
        //下载进度条
        DispatchQueue.global().async {
            self.dowmloadProgress()
        }
    }
    

    func dowmloadProgress() {
        for i in 0...100{
            sleep(1)
            let value = Float(i) / 100.0
            DispatchQueue.main.async {
                self.progressView.progress = CGFloat(value)
                self.valueLab.text = String(format:"%.1f%%",value * 100.0)
            }
        }
    }

}
