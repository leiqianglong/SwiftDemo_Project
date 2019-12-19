//
//  UnlockView.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/8.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class UnlockView: UIView {

    var currentP:CGPoint = CGPoint.zero
    var arr = [UIButton]()
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    //手指开始点击的时候调用
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let curp = getCurrentPoint(touches: touches)
        
        let btn = setItem(point: curp)
        
        if btn != nil {

            btn?.isSelected = true
            self.arr.append(btn!)
        }
    }
    //手指移动的时候调用
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        let curp = getCurrentPoint(touches: touches)
        self.currentP = curp
        let btn = setItem(point: curp)
        if btn != nil {
            if btn!.isSelected == false {
                btn?.isSelected = true
                self.arr.append(btn!)
            }
        }
        self.setNeedsDisplay()
    }
    //手指离开屏幕的时候调用
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let str = NSMutableString.init()
        for i in 0..<self.arr.count{
            let btn = self.arr[i]
            str.append(String(btn.tag))
            btn.isSelected = false
        }
        // 清空路径
        self.arr.removeAll()
        setNeedsDisplay()
    }
    override func draw(_ rect: CGRect) {
        if self.arr.count <= 0 {
            return
        }
        let path = UIBezierPath.init()
        for i in 0..<self.arr.count{
            let btn = self.arr[i]
            if i == 0 {
                path.move(to: btn.center)
            }else{
                path.addLine(to: btn.center)
            }
        }
        path.addLine(to: self.currentP)
        UIColor.green.set()
        path.lineWidth = 10.0
        path.lineJoinStyle = .round
        path.stroke()
    }
    func getCurrentPoint(touches: Set<UITouch>) -> CGPoint {
        let touch = (touches as NSSet).anyObject() as AnyObject
        return touch.location(in:self)
    }
    func setItem(point:CGPoint) -> UIButton? {
        for (_,item) in self.subviews.enumerated(){
            let btn = item as! UIButton
            //判断此点是否在按钮上
            if btn.frame.contains(point) {
               return btn
            }
        }
        return nil
    }
    func setup() {
        for i in 0..<9{
            let btn = UIButton(type: UIButtonType.custom)
            btn.isUserInteractionEnabled = false
            btn.tag = i
            btn.setImage(UIImage(named: "gestuer-normal"), for: .normal)
            btn.setImage(UIImage(named: "gestuer-selected"), for: .selected)
            self.addSubview(btn)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let clomn = 3
        var x : CGFloat = 0
        var y : CGFloat = 0
        let btnWH : CGFloat = 74
        let margin = (self.bounds.size.width - btnWH * CGFloat(clomn)) / CGFloat((clomn + 1))
        for i in 0..<9{
            let currentClomn = i % clomn
            let currentRow = i / clomn
            x = margin + CGFloat(currentClomn) * (btnWH + margin)
            y = CGFloat(currentRow) * (btnWH + margin)
            let btn = self.subviews[i] as! UIButton
            btn.frame = CGRect(x: x, y: y, width: btnWH, height: btnWH)
        }
        
        
    }
}
