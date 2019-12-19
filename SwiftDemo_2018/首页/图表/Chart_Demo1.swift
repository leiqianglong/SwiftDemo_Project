//
//  Chart_Demo1.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/17.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class Chart_Demo1: BaseViewController {

    var chartView:QRChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chartView = QRChartView.init(frame: CGRect(x: 0, y: 100, width: KscreenWidth, height: KscreenWidth))

        chartView.backgroundColor = UIColor.lightGray
        view.addSubview(chartView)
        chartView.titleSource = ["Pate","Any","Marry","Audo","Rudy","Pate","Any","Marry","Audo","Rudy","Pate","Any","Marry","Audo","Rudy"]
        chartView.valueSource = ["10","30","33","15","25","10","30","33","15","25","10","30","33","15","25"]
    }



}
