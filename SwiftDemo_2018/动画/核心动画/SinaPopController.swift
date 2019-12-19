//
//  SinaPopController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/11.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class SinaPopController: UIViewController {

    var items = ["点评","更多","拍摄","相册","文字","签到"]
    var arrs = [ItemBtn]()
    var btnIndex = 0
    var timer:Timer!
    var closeBtn:UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        addItemBtn()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
    }

    deinit {
        QLog("sina控制器销毁了")
    }
    @objc func update(){
        if btnIndex == arrs.count {
            //销毁定时器
            timer.invalidate()
            timer = nil
            return
        }
        let btn = arrs[btnIndex]

        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions.curveLinear, animations: {
              btn.transform = CGAffineTransform.identity
        }) { (_) in
            
        }
        btnIndex += 1
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.1 * Double(items.count)) {
             self.closeBtn.transform = CGAffineTransform.identity
        }
    }
    //添加按钮
    private func addItemBtn() {
   
        let btnWH:CGFloat = 100
        let cloum = 3
        let margin = (UIScreen.main.bounds.size.width - CGFloat(cloum) * btnWH)/(CGFloat(cloum)+1)
        var x:CGFloat = 0
        var y:CGFloat = 0
        var currentCloum:CGFloat = 0
        var currentRow:CGFloat = 0
        let origY:CGFloat = 300
        for i in 0..<items.count {
            let btn = ItemBtn(type: UIButtonType.custom)
            currentCloum = CGFloat(i % cloum)
            currentRow = CGFloat(i / cloum)
            x = margin + (btnWH + margin) * currentCloum
            y = (btnWH + margin) * currentRow + origY
            btn.frame = CGRect(x: x, y: y, width: btnWH, height: btnWH)
            btn.setImage(UIImage(named:items[i]), for: .normal)
            btn.setTitle(items[i], for: .normal)
            btn.setTitleColor(UIColor.darkText, for: .normal)
            self.view.addSubview(btn)
            //设置按钮位置
            btn.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.size.height)
            btn.addTarget(self, action: #selector(itemClick(btn:)), for: UIControlEvents.touchDown)
            btn.addTarget(self, action: #selector(itemClick1(btn:)), for: UIControlEvents.touchUpInside)//手指抬起调用
            self.arrs.append(btn)
        }
        //添加关闭按钮
        closeBtn = UIButton.init(type: UIButtonType.custom)
        closeBtn.setImage(UIImage(named: "tabbar_compose_background_icon_close"), for: .normal)
        self.view.addSubview(closeBtn)
        closeBtn.frame = CGRect(x: KscreenWidth*0.5 - 20, y: KscreenHeight-80, width: 40, height: 40)

//        closeBtn.transform = CGAffineTransform(rotationAngle:-CGFloat(Float.pi / 4))
        
        var tras = closeBtn.transform
        tras = tras.rotated(by: -3.14/4)
        closeBtn.transform = tras
        
        closeBtn.isUserInteractionEnabled = false
    }
    //按钮放大效果 当手指按下调用
    @objc func itemClick(btn:ItemBtn){
        UIView.animate(withDuration: 0.5) {
           btn.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
    }
    //当手指抬起调用
    @objc func itemClick1(btn:ItemBtn){
        UIView.animate(withDuration: 0.5, animations: {
            btn.alpha = 0
            btn.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) { (_) in
             self.dismiss(animated: true, completion: nil)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true, completion: nil)
    }

}
//自定义按钮
class ItemBtn: UIButton {
    //返回btn中lab的尺寸位置
//    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
//
//    }
    override func awakeFromNib() {
        super.awakeFromNib()
        iniUI()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        iniUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func iniUI(){
        self.imageView?.contentMode = .center
        self.titleLabel?.textAlignment = .center
        self.isHighlighted = false
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let imgW:CGFloat = self.bounds.size.width
        let imgH:CGFloat = self.bounds.size.height * 0.8
        let x : CGFloat = 0
        let y : CGFloat = 0
        self.imageView?.frame = CGRect(x: x, y: y, width: imgW, height: imgH)
        
        let labx:CGFloat = x
        let laby:CGFloat = imgH
        let labw:CGFloat = imgW
        let labh:CGFloat = self.bounds.size.height - imgH
        self.titleLabel?.frame = CGRect(x: labx, y: laby, width: labw, height: labh)

    }
}







