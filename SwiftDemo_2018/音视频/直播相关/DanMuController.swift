//
//  DanMuController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/16.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit
import BarrageRenderer
import SDAutoLayout
class DanMuController: BaseViewController {

    var infoLabel = UILabel()

    lazy var renderer:BarrageRenderer = {
        let r = BarrageRenderer.init()
        r.canvasMargin = UIEdgeInsets(top: 100, left: 10, bottom: 10, right: 10)
        r.view.isUserInteractionEnabled = true
        return r
    }()

    var safeObj:NSSafeObject!
    var timer:Timer?

    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.infoLabel.frame = CGRect(x: 0, y: 64, width: UIScreen.main.bounds.size.width, height: 20)
        view.addSubview(infoLabel)
        view.addSubview(renderer.view)
        view.sendSubview(toBack: renderer.view)

        
        setupAutoWidthViewsWithCount(count: 4, margin: 10)

    }

    deinit {
        renderer.stop()
    }
 
    
    @objc func btnClick(btn:UIButton) {
        
        switch btn.tag {
        case 0:
            renderer.start()
            break
        case 1:
          renderer.pause()
            break
        case 2:
             renderer.start()
            break
        case 3:
            renderer.stop()
            break
        default:
           
            break
        }
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.safeObj = NSSafeObject.init(object: self, with: #selector(autoSendBarrage))
        initTimer()
    }
    
     func initTimer() -> Timer{
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 0.5, target: self.safeObj, selector: #selector(NSSafeObject.excute), userInfo: nil, repeats: true)
        }
        return timer!
    }
    @objc private func autoSendBarrage(){
        
        let spriteNumber:Int = self.renderer.spritesNumber(withName: nil)
        self.infoLabel.text = "当前屏幕弹幕数量：" + "\(spriteNumber)"
        if spriteNumber <= 500 {
            self.renderer.receive(walkTextSpriteDescriptorWithDirection(direction: BarrageWalkDirection.R2L, side: BarrageWalkSide.default))
        }
        
    }
    // mark - 弹幕描述符生成方法
    func walkTextSpriteDescriptorWithDirection(direction:BarrageWalkDirection,side:BarrageWalkSide) -> BarrageDescriptor {
        let descriptor = BarrageDescriptor.init()
        descriptor.spriteName = NSStringFromClass(BarrageWalkTextSprite.self)
        index += 1
        descriptor.params["text"] = "过场文字弹幕:" + "\(index)"
        descriptor.params["textColor"] = UIColor.orange
        descriptor.params["speed"] = 100 * Double(arc4random())/Double(RAND_MAX) + 50
        descriptor.params["direction"] = 1
        descriptor.params["side"] = 0
        descriptor.params["clickAction"] = {()->() in
            print("弹幕被点击")
        }
        
        return descriptor
    }
    func setupAutoWidthViewsWithCount(count:Int,margin:CGFloat) -> Void {
        
        let btnView = UIView()
        btnView.backgroundColor = UIColor.orange
        view.addSubview(btnView)
        
        var titles = [String]()
        titles.append("start")
        titles.append("pause")
        titles.append("recover")
        titles.append("stop")
        
        var temp = Array<UIButton>()
        
        for i in 0..<count {
            let btn = UIButton(type: UIButtonType.custom)
            btn.backgroundColor = UIColor.gray
            btnView.addSubview(btn)
            btn.setTitle(titles[i], for: UIControlState.normal)
            btn.sd_layout().autoHeightRatio(0.4)
            temp.append(btn)
            btn.tag = i
            btn.addTarget(self, action: #selector(btnClick(btn:)), for: .touchUpInside)
        }
        btnView.sd_layout().leftSpaceToView(view,10)?.rightSpaceToView(view,10)?.bottomSpaceToView(view,10)?.heightIs(80.0)
        
        btnView.setupAutoWidthFlowItems(temp, withPerRowItemsCount: count, verticalMargin: margin, horizontalMargin: margin, verticalEdgeInset: 5, horizontalEdgeInset: 10)
    }
}
