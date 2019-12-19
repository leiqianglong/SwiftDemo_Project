//
//  Const.swift
//  Demo
//
//  Created by hou on 2017/10/9.
//  Copyright © 2017年 hrscy. All rights reserved.
//

import UIKit

var allowRotation:Bool = false

/// 屏幕的宽
let KscreenWidth = UIScreen.main.bounds.width
/// 屏幕的高
let KscreenHeight = UIScreen.main.bounds.height
// 导航栏高度
let kNavBarHeight: CGFloat = 64.0
/// idfv
let idfv = UIDevice.current.identifierForVendor?.uuidString
/// 版本号
let versionCode = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
/// 系统版本号
let systemVersion = UIDevice.current.systemVersion
//APP主题色
let UIAppColor = UIColor.init(red: 63.0/255.0, green: 162.0/255.0, blue: 246.0/255.0, alpha: 1)


let IPHONE_SE:Float = 320.0
let IPHONE_7:Float = 375.0
let IPHONE_7P:Float = 414.0
//用户信息Key
let DefaultKey_UserInfo = "DefaultKey_UserInfo"

/// 展位图片
let DefauleImage = UIImage(named: "zhanwei")


func QLog<T>(_ message: T, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line)
{
    #if DEBUG
        //    print("\((fileName as NSString).pathComponents.last!).\(methodName)[\(lineNumber)]:\(message)")
        print("\(methodName)[\(lineNumber)]:\(message)")
    #endif
}









