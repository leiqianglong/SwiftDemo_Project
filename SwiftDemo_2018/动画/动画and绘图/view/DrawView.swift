//
//  RedView.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/7.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit
 /**
 画直线
 */
class RedView: UIView {
    override func draw(_ rect: CGRect) {
        //1.取得和view相关联的上下文
        let ctx = UIGraphicsGetCurrentContext()
        //2.描述路径
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addLine(to: CGPoint(x: 80, y: 20))
        path.move(to: CGPoint(x: 10, y: 30))
        path.addLine(to: CGPoint(x: 90, y: 80))
        path.addLine(to: CGPoint(x: 90, y: 20))
        //设置上下文状态
        ctx?.setLineWidth(3.0) //设置线宽
        ctx?.setLineJoin(CGLineJoin.round) //设置线条 连接处的样式
        ctx?.setLineCap(CGLineCap.square) //设置线头样式
        UIColor.green.setStroke() //设置线条颜色
//        UIColor.purple.setFill()
        //3.吧路径添加到上下文
        ctx?.addPath(path.cgPath)
        //4.吧上下文内容显示到view
        ctx?.strokePath()
    }
}

/**
 画曲线
 */
class CurveLineView: UIView {
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        //设置起点
        let path = UIBezierPath.init()
        path.move(to: CGPoint(x: 10, y: 80))
        path.addQuadCurve(to: CGPoint(x: 80, y: 80), controlPoint: CGPoint(x: 15, y: 20))
        ctx?.setLineWidth(4.0)
        //把路径添加到上下文
        ctx?.addPath(path.cgPath)
        //把上下问的内容显示出来
        ctx?.strokePath()
    }
}

/**
 画图形
 */
class DrawGraphView: UIView {
    override func draw(_ rect: CGRect) {
        let ctx = UIGraphicsGetCurrentContext()
        //设置起点
        let path = UIBezierPath.init(rect:CGRect(x: 10, y: 10, width: 40, height: 40))
        //把路径添加到上下文
        ctx?.addPath(path.cgPath)
        UIColor.orange.set()
        //把上下问的内容显示出来
//        ctx?.strokePath() //设置边框
        ctx?.fillPath() //设置填充
        
        
        
        //设置起点
        let path2 = UIBezierPath.init(rect:CGRect(x: 55, y: 55, width: 40, height: 40))
        ctx?.setLineWidth(2.0)
        UIColor.cyan.set()
        ctx?.addPath(path2.cgPath)
        ctx?.strokePath() //设置边框颜色
    }
}
/**
 画圆角矩形
 */
class DrawRoundGraphView: UIView {
    override func draw(_ rect: CGRect) {
        //1
       let path = UIBezierPath.init(roundedRect: CGRect(x: 10, y: 10, width: 40, height: 40), cornerRadius: 6.0)
        path.stroke()
        
        //2
        let path2 = UIBezierPath.init(roundedRect: CGRect(x: 55, y: 55, width: 40, height: 40), cornerRadius: 6.0)
        UIColor.magenta.set()
        path2.fill()
    }
    
}
/**
 画圆形
 */
class DrawRoundView: UIView {
    
    override func draw(_ rect: CGRect) {
        //圆
         let path = UIBezierPath.init(ovalIn: CGRect(x: 10, y: 10, width: 50, height: 50))
        UIColor.brown.set()
        path.fill()
        
        //椭圆
        let path2 = UIBezierPath.init(ovalIn: CGRect(x: 45, y: 65, width: 50, height: 30))
        UIColor.blue.set()
        path2.fill()
    }
}

/**
 画扇形
 */
class DrawSectorView: UIView {
    override func draw(_ rect: CGRect) {
        //画圆弧
        //圆心
         let center = CGPoint(x: rect.size.width * 0.5, y: rect.size.height * 0.5)
        //半径
        let radius:CGFloat = rect.size.width * 0.5 - 10
        //开始角度
        let startA:CGFloat = 0
        //结束角度
        let endA:CGFloat = CGFloat(Float.pi * 0.5)
        //clockwise ：yes 顺时针 no 逆时针
        let path = UIBezierPath.init(arcCenter: center, radius: radius, startAngle: startA, endAngle: endA, clockwise: true)
        UIColor.red.set()
        path.stroke()
        
        //画扇形
        //开始角度
        let startA1:CGFloat = -CGFloat(Float.pi * 0.5)
        //结束角度
        let endA1:CGFloat = -CGFloat(Float.pi)
        let path1 = UIBezierPath.init(arcCenter: center, radius: radius, startAngle: startA1, endAngle: endA1, clockwise: false)
        path1.addLine(to: center)
        //关闭路径
        path1.close()
        UIColor.green.set()
        path1.fill()
    }
}


/**
 画下载进度
 */
class ProgressView: UIView {
    var progress:CGFloat = 0.0{
        didSet{
//            draw(self.bounds)
            self.setNeedsDisplay() //底层会调用draw方法
        }
    }
    override func draw(_ rect: CGRect) {
        let center = CGPoint(x: rect.size.width * 0.5, y: rect.size.height * 0.5)
        let radius:CGFloat = rect.size.width * 0.5 - 10
        let startA:CGFloat = -CGFloat(Float.pi * 0.5)
        let endA:CGFloat = -CGFloat(Float.pi * 0.5) + (progress * CGFloat(Float.pi * 2))
        let path = UIBezierPath.init(arcCenter: center, radius: radius, startAngle: startA, endAngle: endA, clockwise: true)
        path.lineWidth = 3.0
        UIColor.red.set()
        path.stroke()
    }
}


/**
 画饼图
 */
class PieView: UIView {
    override func draw(_ rect: CGRect) {
        //饼图数据
        let arr = [22,34,24,20]

        let center = CGPoint(x: rect.size.width * 0.5, y: rect.size.height * 0.5)
        let radius:CGFloat = rect.size.width * 0.5 - 10
        var startA:CGFloat = 0
        var angle:CGFloat = 0
        var endA:CGFloat = 0
        //遍历饼图中数据
        for (_,item) in arr.enumerated() {
            startA = endA
            angle = CGFloat(Float(item) / 100.0 * Float.pi * 2)
            endA = startA + angle
            let path =  UIBezierPath.init(arcCenter: center, radius: radius, startAngle: startA, endAngle: endA, clockwise: true)
            path.addLine(to: center)
            UIColor.randomColor().set()
            path.fill()
        }
    }

}
/**
 画文字
 */
class WorldView: UIView {
    override func draw(_ rect: CGRect) {
        let str:NSString = "我爱跑步，天天迟到"

        let dic:NSDictionary = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 20),
                                NSAttributedStringKey.foregroundColor:UIColor.red.cgColor]

        //文字较多不会换行
//        str.draw(at: CGPoint.zero, withAttributes: (dic as! [NSAttributedStringKey : Any]))
        //文字较多时 会换行
        str.draw(in: rect, withAttributes: (dic as! [NSAttributedStringKey : Any]))
    }
}
/**
 画图片
 */
class PictureView: UIView {
    override func draw(_ rect: CGRect) {
        let image = UIImage(named: "icon2")
//        image?.draw(at: CGPoint.zero) //绘制出来的图片会保持原来图片大小
//        image?.drawAsPattern(in: rect) //图片平铺到rect区域
        
        //添加一个裁剪区域 超出部分透明显示
        UIRectClip(CGRect(x: 20, y: 20, width: 50, height: 50))
        image?.draw(in: rect) //图片填充到rect区域当中
        
//        //填充一个矩形
//        UIColor.orange.set()
//        UIRectFill(CGRect(x: 0, y: 0, width: 20, height: 20))
    }
}
/**
 画图片1
 */
class PictureView1: UIView {
    override func draw(_ rect: CGRect) {
        //填充一个矩形
        UIColor.orange.set()
        UIRectFill(CGRect(x: 20, y: 20, width: 50, height: 50))
    }
}

/**
 自定义 imageview
 */
class MyImageView: UIView {
    var image:UIImage? = nil {
        didSet{
            self.setNeedsDisplay()
        }
    }
    override func draw(_ rect: CGRect) {
        image?.draw(in: rect)
    }
}
/**
 画 雪花
 */
class SnowFlakeView: UIView {
    var snowY:CGFloat = 0.0
    override func draw(_ rect: CGRect) {
         let image = UIImage(named: "雪花.png")
         image?.draw(at: CGPoint(x: rect.size.width * 0.5, y: snowY))
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //定时器
        let link = CADisplayLink.init(target: self, selector: #selector(updateFlow))
        link.add(to: .main, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    @objc private func updateFlow(){
        snowY += 10.0
        if snowY > self.bounds.size.height{
            snowY = 0.0
        }
        setNeedsDisplay()
    }
}
/**
 画 十字架
 */
class DrawCrossView: UIView {
    override func draw(_ rect: CGRect) {
        //1.获取上下文
        let ctx = UIGraphicsGetCurrentContext()
        var path = UIBezierPath.init()
        path.move(to: CGPoint(x: 0, y: 80))
        path.addLine(to: CGPoint(x: 200, y: 80))
        //把当前的状态保存到图片上下文栈里
        ctx?.saveGState()
        
        UIColor.red.set()
        ctx?.setLineWidth(5.0)
        
        ctx?.addPath(path.cgPath)
        ctx?.strokePath()
        
        
        path = UIBezierPath.init()
        path.move(to: CGPoint(x: 75, y: 10))
        path.addLine(to: CGPoint(x: 75, y: 200))
        
        //恢复上下文状态栈
        ctx?.restoreGState()
        ctx?.addPath(path.cgPath)
        //吧上下文的内容渲染出来
        ctx?.strokePath()
    }

}

/**
 上下文矩阵的操作
 */
class MatrixView: UIView {
    override func draw(_ rect: CGRect) {
        //获得上下文
        let ctx = UIGraphicsGetCurrentContext()
        //描述路径
        let path = UIBezierPath.init(ovalIn: CGRect(x: -100, y: -50, width: 200, height: 100))
        UIColor.red.set()
        //平移 必须在添加路劲之前操作 即addPath以前
        ctx?.translateBy(x: 100, y: 50)
        //缩放
        ctx?.scaleBy(x: 0.5, y: 0.5)
        //旋转 四分之π
        ctx?.rotate(by: CGFloat(Float.pi/4.0))
        //吧路劲添加到上下文
        ctx?.addPath(path.cgPath)
        //吧上下文的内容渲染出来
        ctx?.fillPath()
        
    }
    
}









































































