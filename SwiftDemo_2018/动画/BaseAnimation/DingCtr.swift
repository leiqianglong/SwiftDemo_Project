//
//  DingCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/3/20.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import SnapKit

class DingCtr: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.navigationItem.title = "钉钉泡泡"
        
        dingdingAnimation()
    }

    func dingdingAnimation() {
      
        view.addSubview(upMenuView)
        
        
        let vvv = UIView()
        vvv.backgroundColor = UIColor.red
        self.view.addSubview(vvv)
        
        vvv.snp.makeConstraints { (maek) in
            maek.left.equalToSuperview().offset(15)
            maek.top.equalToSuperview().offset(20)
            maek.width.height.equalTo(100)
        }
        
        
        
        
        
    }
    func createDemoButtonArray() -> Array<UIButton> {
        var buttonsMutable:[UIButton] = []
        let titleArr = ["发帖子", "发病例", "发直播", "发视频"]
        
        for (index,title) in titleArr.enumerated() {
            let button = UIButton(type: .custom)
            button.setTitleColor(UIColor.white, for: UIControlState.normal)
            button.setTitle(title, for: UIControlState.normal)
            button.setImage(UIImage(named:titleArr[index]), for: UIControlState.normal)
            button.frame = CGRect(x: 0, y: 0, width: 121, height: 50)
            button.tag = index
            button.adjustsImageWhenHighlighted = false
            button.addTarget(self, action: #selector(dwBtnClick), for: UIControlEvents.touchUpInside)
            buttonsMutable.append(button)
        }
        return buttonsMutable
    }
    
    @objc func dwBtnClick(btn:UIButton){

        if btn.tag == 0 { //发帖

        }
    }
    private  lazy var coverView : UIControl = {
        let cv = UIControl(frame: CGRect(x: 0, y: 0, width: KscreenWidth, height: KscreenHeight))
        cv.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        cv.addTarget(self, action: #selector(coloseUpMenu), for: UIControlEvents.touchUpInside)
        return cv
    }()
    
    private lazy var upMenuView : DWBubbleMenuButton = {
        let upView = DWBubbleMenuButton.init(frame: CGRect(x: KscreenWidth - 135, y: KscreenHeight - 120, width: 120, height: 53), expansionDirection: ExpansionDirection.DirectionUp)
        upView?.delegate = self
        let homeLabel = menuBtn
        upView?.homeButtonView = homeLabel
        upView?.buttonSpacing = 10
        upView?.addButtons(createDemoButtonArray())
        return upView!
    }()
    private lazy var menuBtn : UIButton = {
        let itemSize = 53
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named:"addBtn"), for: UIControlState.normal)
        button.frame = CGRect(x: 120-itemSize, y: 0, width: itemSize, height: itemSize)
        button.isUserInteractionEnabled = false
        return button
    }()
    
    @objc private func coloseUpMenu(){
        upMenuView.dismissButtons()
    }
}
extension DingCtr:DWBubbleMenuViewDelegate{
    //将要出现
    func bubbleMenuButtonWillExpand(_ expandableView: DWBubbleMenuButton!) {
        UIApplication.shared.keyWindow?.insertSubview(coverView, belowSubview: expandableView)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.menuBtn.layer.transform = CATransform3DMakeRotation(CGFloat(Double.pi / 4), 0, 0, 1)
            })
        }
        upMenuView.frame = CGRect(x: KscreenWidth - 135, y: KscreenHeight - 120, width: 120, height: 53)
        menuBtn.frame = CGRect(x: 120-53, y: 0, width: 53, height: 53)
    }
    //已经出现
    func bubbleMenuButtonDidExpand(_ expandableView: DWBubbleMenuButton!) {
     
        
    }
    //将要消失
    func bubbleMenuButtonWillCollapse(_ expandableView: DWBubbleMenuButton!) {
        coverView.removeFromSuperview()
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.menuBtn.layer.transform = CATransform3DIdentity
            })
        }
    }
    //已经消失
    func bubbleMenuButtonDidCollapse(_ expandableView: DWBubbleMenuButton!) {
      
        upMenuView.frame = CGRect(x: KscreenWidth - 53-15, y: KscreenHeight - 120, width: 53, height: 53)
        menuBtn.frame = CGRect(x: 0, y: 0, width: 53, height: 53)
    }
}
