//
//  SystemNotiController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class SystemNotiController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "自定义", style: UIBarButtonItemStyle.done, target: self, action: #selector(nextVc))
        
        NotificationCenter.default.addObserver(self, selector: #selector(notiClick), name: NSNotification.Name.EBBannerViewDidClick, object: nil)
        
    }

    //点击回调事件
   @objc private func notiClick(){
    QLog("点击通知条了。。。。")
    }
    //system style (当前系统样式)
    @IBAction func oneBtn(_ sender: Any) {
        EBBannerView.show(withContent: "通知来了。。")
        
        /*
        //完全等同于
        let ban = EBBannerView.banner { (make) in
            make?.style = EBBannerViewStyleiOS9
            make?.content = "这是一条消息"
        }
        ban?.show()
         */
    }
    
    //style with short text (iOS 9 样式/少量文字)
    @IBAction func secBtn(_ sender: Any) {
        let ban = EBBannerView.banner { (make) in
            make?.style = EBBannerViewStyleiOS9
            make?.content = "这是一条消息,是少量文字"
        }
        ban?.show()
    }

    //(iOS 9 样式/大量文字)
    @IBAction func treBtn(_ sender: Any) {
        let ban = EBBannerView.banner { (make) in
            make?.style = EBBannerViewStyleiOS9
            make?.content = "MINE eye hath played the painter and hath stelled Thy beauty's form in table of my heart;My body is the frame wherein 'tis held,And perspective it is best painter's art.For through the painter must you see his skillTo fine where your true image pictured lies,Which in my bosom's shop is hanging still,That hath his windows glazèd with thine eyes."
        }
        ban?.show()
    }
    //(iOS 10 样式)
    @IBAction func fourBtn(_ sender: Any) {
        let ban = EBBannerView.banner { (make) in
            make?.style = EBBannerViewStyleiOS10
            make?.content = "这是ios10样式的通知"
        }
        ban?.show()
    }
    //(iOS 11 样式)
    @IBAction func fiveBtn(_ sender: Any) {
        let ban = EBBannerView.banner { (make) in
            make?.style = EBBannerViewStyleiOS11
            make?.icon = UIImage(named: "icon2")
            make?.content = "这是ios11。。。。    样式的通知"
            make?.date = "2018 10 11"
        }
        ban?.show()
    }
    
   @objc private func nextVc(){
        let nexv = CustomNotiController()
        navigationController?.pushViewController(nexv, animated: true)
    }
    deinit {
        QLog("deinit")
    }
    
    @IBAction func jkNoti(_ sender: Any) {
        self.navigationController?.pushViewController(JKnotiController(), animated: true)
    }
    
}
