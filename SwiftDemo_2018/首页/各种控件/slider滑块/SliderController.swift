//
//  SliderController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class SliderController: BaseViewController {
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


        //jlslider
        let slider = JLSliderView.init(frame: CGRect(x: 0, y: 80, width: KscreenWidth, height: 60))
        slider.sliderType = JLSliderType.center
        slider.minValue = 0
        slider.maxValue = 100
        view.addSubview(slider)
        
        let slider2 = JLSliderView.init(frame: CGRect(x: 0, y: 150, width: KscreenWidth, height: 100))
        slider2.sliderType = JLSliderType.bottom
        view.addSubview(slider2)
        
        //slider
        let sfSlider = SFDualWaySlider.init(frame: CGRect(x: 10, y: 250, width: KscreenWidth-20, height: 100), minValue: 0, maxValue: 80, blockSpaceValue: 2)
        sfSlider?.progressRadius = 5
        sfSlider?.minIndicateView.setTitle("不限")
        sfSlider?.maxIndicateView.setTitle("不限")
        sfSlider?.lightColor = UIColor.yellow
        sfSlider?.minIndicateView.backIndicateColor = UIColor.green
         sfSlider?.maxIndicateView.backIndicateColor = UIColor.green
//        sfSlider?.indicateViewOffset = 10
//        sfSlider?.indicateViewWidth = 80
        sfSlider?.sliderValueChanged = { minValue,maxValue in
            
        }
      
        sfSlider?.getMaxTitle = { minValue in
            if Double(minValue) == 0.0 {
                return "不限"
            }else{
                return String(Double(minValue)) + "k"
            }
        }
        
        sfSlider?.getMaxTitle = { maxValue in
            if Double(maxValue) == 0.0 {
                return "不限"
            }else{
                return String(Double(maxValue)) + "k"
            }
        }
        view.addSubview(sfSlider!)
 
    }


}
