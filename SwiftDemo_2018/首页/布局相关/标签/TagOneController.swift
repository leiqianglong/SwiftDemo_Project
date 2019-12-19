//
//  TagOneController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/1.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class TagOneController: BaseViewController,TTTagViewDelegate,TTGroupTagViewDelegate {

    var isAdd = false
    
    var tagView : TTGroupTagView!
    
    
    var inputHeight:CGFloat = 50.0
    var inputTagView:TTTagView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        navigationItem.title = isAdd ? "添加" : "显示"

        isAdd ? initAdd() : initShow()
    }

    private func initAdd(){
        
        inputTagView = TTTagView.init(frame: CGRect(x: 0, y: 100, width: KscreenWidth, height: self.inputHeight))
        inputTagView.backgroundColor = UIColor.white
        inputTagView.translatesAutoresizingMaskIntoConstraints = true
        view.addSubview(inputTagView)
        inputTagView.delegate = self
        inputTagView.inputTextColor = UIColor.red
        inputTagView.inputBorderColor = UIColor.orange
        inputTagView.textColor = UIColor.green
        inputTagView.borderColor = UIColor.purple
        inputTagView.layoutTagviews()

        inputTagView.resignFirstResponder()
    }
    
    private func initShow(){
        //添加tagview
        tagView = TTGroupTagView.init(frame: CGRect(x: 0, y: 100, width: KscreenWidth, height: kScreenH))
        tagView.changeHeight = 0
        tagView.bgColor = UIColor.orange
        tagView.textColor = UIColor.lightGray
        tagView.borderColor = UIColor.blue
        tagView.selBgColor = UIColor.red
        tagView.selTextColor = UIColor.lightGray
        tagView.selBorderColor = UIColor.yellow
        tagView.backgroundColor = UIColor.clear
        view.addSubview(tagView)
        //        tagView.isUserInteractionEnabled = false
        tagView.addTags(["是的","打发的说法","快乐据了解","四等分","围殴若无","大发送到发的发的是","噗噗"])
    }
    
    //MARK -- TTTagViewDelegate
    func finishInput(_ string: String!) {
        QLog("string")
    }
    func deleteBtnClick(_ string: String!) {
        QLog("string")
    }
    
    
    //MARK -- TTGroupTagViewDelegate
    func buttonClick(_ string: String!, and isDelete: Bool) {

        QLog(string)
        
    }
}
