//
//  SwichCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/1.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class SwichCtr: BaseViewController {

    
    var mySwitch:WZSwitch?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let sitch1 = LQXSwitch.init(frame:CGRect(x: 100, y: 100, width: 100, height: 50),
                                    on: UIColor(red: 240 / 255.0, green: 0 / 255.0, blue: 130 / 255.0, alpha: 1.0), offColor:UIColor(red: 0 / 255.0, green: 192 / 255.0, blue: 246 / 255.0, alpha: 1.0),
                                    font: UIFont.systemFont(ofSize: 25),
                                    ballSize: 30)
        sitch1?.onText = "女"
        sitch1?.offText = "男"
        view.addSubview(sitch1!)
        sitch1?.tag = 1
        sitch1?.addTarget(self, action: #selector(switchSex(switchs:)), for: .touchUpInside)
        

        let sitch2 = LQXSwitch.init(frame:CGRect(x: 100, y: 200, width: 100, height: 40),
                                    on:UIColor(red: 11 / 255.0, green: 179 / 255.0, blue: 252 / 255.0, alpha: 1.0), offColor: UIColor(red: 247 / 255.0, green: 224 / 255.0, blue: 248 / 255.0, alpha: 1.0),
                                    font: UIFont.systemFont(ofSize: 15),
                                    ballSize: 22)
        sitch2?.onText = "开"
        sitch2?.offText = "关"
        view.addSubview(sitch2!)
        sitch2?.tag = 2
        sitch2?.addTarget(self, action: #selector(switchSex(switchs:)), for: .touchUpInside)
        

        
        mySwitch = WZSwitch.init(frame: CGRect(x: 100, y: 300, width: 120, height: 36))
        mySwitch?.setSwitchState(true, animation: true)
        mySwitch?.textFont = UIFont.systemFont(ofSize: 15, weight: UIFont.Weight.bold)
        mySwitch?.block = {[weak self] state in
             //yes 音频  no 视频
            
            QLog(state)
        }
        view.addSubview(mySwitch!)

        let btn = UIButton(type: UIButtonType.custom)
        btn.frame = CGRect(x: 100, y: 400, width: 150, height: 50)
        btn.backgroundColor = UIColor.lightGray
        btn.setTitle("更多switch请看", for: UIControlState.normal)
        view.addSubview(btn)
        btn.addTarget(self, action: #selector(btnClick), for: .touchUpInside)
        
    }

    @objc private func switchSex(switchs:LQXSwitch){
        QLog(switchs.tag)
    }
    
    
   @objc private func btnClick(){
        let vc = ZJViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
