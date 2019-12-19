 //
//  WheelView.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/9.
//  Copyright © 2019 hou. All rights reserved.
//

 ///幸运大转盘
 
import UIKit

class WheelView: UIView,CAAnimationDelegate{

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var contentView: UIImageView!
    //记录上次选中的按钮
    var preBtn:UIButton?
    class func wheelView() -> WheelView{
        return Bundle.main.loadNibNamed("WheelView", owner: self, options: nil)?.last as! WheelView
    }
 

    //开始旋转
    func startAnimi() {
        self.link.isPaused = false
    }

    @objc func run(){
        self.contentView.transform = CGAffineTransform(rotationAngle: CGFloat(Float.pi/180)).concatenating(self.contentView.transform)
    }
    //停止
    func stopAnimi() {
        self.link.isPaused = true
    }

    lazy var link:CADisplayLink = {
        let lin = CADisplayLink.init(target: self, selector: #selector(run))
        lin.add(to: RunLoop.main, forMode: RunLoopMode.defaultRunLoopMode)
        return lin
    }()
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.isUserInteractionEnabled = true
        initUI()
        startBtn.addTarget(self, action: #selector(startRun(sender:)), for: .touchUpInside)
    }
    @objc func startRun(sender:UIButton){
        let anim = CABasicAnimation.init()
        anim.keyPath = "transform.rotation"
        anim.toValue = Float.pi*3
        anim.duration = 1
        anim.delegate = self
        self.contentView.layer.add(anim, forKey: nil)
    }
    ///MARK ---当核心动画停止的时候调用.
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        //拿当选中按钮的旋转角度.
        let transform:CGAffineTransform = self.preBtn!.transform
        let angel:CGFloat = CGFloat(atan2f(Float(transform.b), Float(transform.a)))
        //让ContentV倒着旋转回去.
        self.contentView.transform = CGAffineTransform(rotationAngle: -angel)
    }
    
    
    @objc func btnClick(sender:UIButton){
        //让上一个选中按钮取消选中装填
        preBtn?.isSelected = false
        //让当前选中按钮选中
        sender.isSelected = true
        //把当前按钮赋值给上个按钮
        preBtn = sender
    }
    func initUI() {
        //加载大图
        let origimge = UIImage(named: "LuckyAstrology")
        //选中图片
        let origSelimge = UIImage(named: "LuckyAstrologyPressed")
        ///获取当前屏幕与像素坐标的比例
        let scale = UIScreen.main.scale //即可获取 几倍屏 @2x @3x
        let clipw:CGFloat = (origimge?.size.width)! / 12 * scale
        let cliph:CGFloat = (origimge?.size.height)! * scale
//        let clipx:CGFloat = 0
        let clipy:CGFloat = 0

        //创建按钮
        let btnW = 68.0
        let btnH = 143.0
        let angle:CGFloat = 30.0
        for i in 0..<12 {
            let btn = WheelButton.init(type: UIButtonType.custom)
            btn.tag = i
            btn.bounds = CGRect(x: 0, y: 0, width: btnW, height: btnH)
            btn.layer.anchorPoint = CGPoint(x: 0.5, y: 1)
            btn.layer.position = CGPoint(x: self.bounds.size.width*0.5, y:  self.bounds.size.height*0.5)
            
            //裁剪图片中某个区域
            let clpimg = origimge?.cgImage?.cropping(to: CGRect(x: clipw*CGFloat(i), y: clipy, width: clipw, height: cliph))
            let clpSelImg = origSelimge?.cgImage?.cropping(to: CGRect(x: clipw*CGFloat(i), y: clipy, width: clipw, height: cliph))
            //设置按钮的图片
            let btnimg = UIImage(cgImage: clpimg!)
            let btnSelImg = UIImage(cgImage: clpSelImg!)
            btn.setImage(btnimg, for: .normal)
            btn.setImage(btnSelImg, for: .selected)
            
            
            btn.setBackgroundImage(UIImage(named: "LuckyRototeSelected"), for: .selected)
            btn.addTarget(self, action: #selector(btnClick(sender:)), for: .touchUpInside)
            self.contentView.addSubview(btn)
           //每个按钮进行旋转
            let angle1 = angle*CGFloat(i)
            btn.transform = CGAffineTransform.init(rotationAngle:angle1/CGFloat(180.0) * CGFloat(Float.pi))
            
            if i == 0 {
                self.btnClick(sender: btn)
            }
        }
    }
}

 ///自定义button
 class WheelButton: UIButton {
    //返回按钮当中的iamgeview尺寸位置 可以调整
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        ///contentRect当前按钮的尺寸位置
        let width:CGFloat = 44
        let height:CGFloat = 50
        let x:CGFloat = (contentRect.size.width-width) * 0.5
        let y:CGFloat = 20
        let rect = CGRect(x: x, y: y, width: width, height: height)
        return rect
    }
 }
