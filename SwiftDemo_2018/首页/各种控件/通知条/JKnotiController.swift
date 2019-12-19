//
//  JKnotiController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import UserNotifications

class JKnotiController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "jkNoti"
    }

    @IBAction func one(_ sender: Any) {
        JKNotifier.showNotifer("亲,您收到了一条自动隐藏的消息哦!")

        JKNotifier.handleClickAction { (name, detail, notifer) in
            QLog(name)
        }
    }
    
    @IBAction func sec(_ sender: Any) {
        let bar = JKNotifier.showNotiferRemain("亲,您收到了一条长存消息哦!点击可以在block中关闭我哦!")
        bar?.handleClickAction({ (name, detail, notifer) in
            
        })

    }
    @IBAction func tre(_ sender: Any) {
        JKNotifier.showNotifer("亲,你收亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,你收到了一条消息哦!亲,息哦!你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲你收到了一条消息哦!亲%@", name: "亲你收到了一条,超长自动隐藏消息哦,点击立即关闭哦", icon: nil)
        JKNotifier.handleClickAction { (name, detail, notif) in
            
        }
   
    }
    @IBAction func four(_ sender: Any) {
        let notice = UILocalNotification()
        notice.alertBody = "收到定时本地推送通知！(recived a UILocalNotification)"
        notice.applicationIconBadgeNumber = 1
        UIApplication.shared.scheduleLocalNotification(notice)
    }
    
}
