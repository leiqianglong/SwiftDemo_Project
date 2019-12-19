//
//  PaletteView.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/8.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class PaletteView: UIView {

    var  path : MyBezierPath!
    var pathArr:NSMutableArray = []
    var lineWidth : CGFloat = 1.0
    var lineColor:UIColor = UIColor.black //默认颜色
    var image:UIImage?{
        didSet{
            self.pathArr.add(image as AnyObject)
            setNeedsDisplay()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = true
        //添加手势
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(pan(sender:)))
        self.addGestureRecognizer(pan)
    }
    
    @objc private func pan(sender:UIPanGestureRecognizer){
        let currentp = sender.location(in: self)
        if sender.state == .began {
            path = MyBezierPath.init()
            self.pathArr.add(path)
            path.lineWidth = lineWidth
            path.color = self.lineColor
            path.lineCapStyle = .butt
            path.lineJoinStyle = .round
            path.move(to: currentp)
        }else if sender.state == .changed{
            path.addLine(to: currentp)
            setNeedsDisplay()
        }else if sender.state == .ended{
            
        }
    }

    override func draw(_ rect: CGRect) {
        for (_,item) in self.pathArr.enumerated(){
            if (item as AnyObject).isKind(of: UIImage.self){
                let img = item as! UIImage
                img.draw(in: rect)
            }else{
                (item as! MyBezierPath).color.set()
                (item as! MyBezierPath).stroke()
            }
        }
    }

    //清屏
    func clearScreen() {
        self.pathArr.removeAllObjects()
        setNeedsDisplay()
    }
    //撤销
    func undo() {
        self.pathArr.removeLastObject()
        setNeedsDisplay()
    }
    //橡皮檫
    func erasure() {
        setLineColorh(color: UIColor.white)
    }
    //设置线宽
    func setLineWidth(width:CGFloat) {
        self.lineWidth = width
        setNeedsDisplay()
    }
    //设置颜色
    func setLineColorh(color:UIColor) {
        self.lineColor = color
         setNeedsDisplay()
    }
}







//添加 color属性
class MyBezierPath: UIBezierPath {
    var color:UIColor = UIColor.black
}








//自定义iamgeview
protocol HandleImageViewDelegate:NSObjectProtocol{
    func handleImageView(handleImageV : HandleImageView,newImage : UIImage)
}
class HandleImageView: UIView,UIGestureRecognizerDelegate {
   
    weak var delegate:HandleImageViewDelegate?

    var image:UIImage? {
        didSet{
            self.imageView.image = image
        }
    }

    private func addGes(imgview:UIImageView){
        //拖拽手势
        let pan = UIPanGestureRecognizer.init(target: self, action: #selector(pan(pan:)))
        imgview.addGestureRecognizer(pan)
        //捏合手势
        let pinch = UIPinchGestureRecognizer.init(target: self, action: #selector(pinch(pinch:)))
        imgview.addGestureRecognizer(pinch)
        
        //添加旋转手势
        let rotation = UIRotationGestureRecognizer.init(target: self, action: #selector(rotation(rotation:)))
        rotation.delegate = self
        imgview.addGestureRecognizer(rotation)
        
        //长安手势
        let longPress = UILongPressGestureRecognizer.init(target: self, action: #selector(longPress(longPress:)))
        imgview.addGestureRecognizer(longPress)
    }
    
    @objc private func pan(pan:UIPanGestureRecognizer){
        let transp = pan.translation(in: pan.view)
        pan.view?.transform = CGAffineTransform.init(translationX: transp.x, y: transp.y).concatenating((pan.view?.transform)!)
        //复位
        pan.setTranslation(CGPoint.zero, in: pan.view)
    }
    @objc private func pinch(pinch:UIPinchGestureRecognizer){
        pinch.view?.transform = CGAffineTransform(scaleX: pinch.scale, y: pinch.scale).concatenating((pinch.view?.transform)!)
        //复位
        pinch.scale = 1
    }
    @objc private func rotation(rotation:UIRotationGestureRecognizer){
        // 旋转图片
        rotation.view?.transform = CGAffineTransform.init(rotationAngle: rotation.rotation).concatenating((rotation.view?.transform)!)
          // 复位,只要想相对于上一次旋转就复位
        rotation.rotation = 0
    }
    @objc private func longPress(longPress:UILongPressGestureRecognizer){
        if longPress.state == .began {
            UIView.animate(withDuration: 0.25, animations: {
                //设置为透明
                self.imageView.alpha = 0
            }) { (_) in
                UIView.animate(withDuration: 0.25, animations: {
                    self.imageView.alpha = 1
                     //把当前的View做一个截屏
                    UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0.0)
                    //获取上下文
                    let ctx = UIGraphicsGetCurrentContext()
                    self.layer.render(in: ctx!)
                    let newimg = UIGraphicsGetImageFromCurrentImageContext()
                    //谨记关闭上下文
                    UIGraphicsEndImageContext()
                    if self.delegate != nil {
                        self.delegate!.handleImageView(handleImageV: self, newImage: newimg!)
                    }
                    //从父控件移除
                    self.removeFromSuperview()
                })
            }
        }
    }
    //能够同时支持多个手势
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    lazy var imageView:UIImageView = {
        let imgview = UIImageView.init()
        imgview.frame = self.bounds
        imgview.isUserInteractionEnabled = true
        self.addSubview(imgview)
        self.addGes(imgview: imgview)
        return imgview
    }()
}
