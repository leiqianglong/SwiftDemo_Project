//
//  PaletteController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/8.
//  Copyright © 2019 hou. All rights reserved.
//
/**
 画板
 */
import UIKit
import SVProgressHUD

class PaletteController: UIViewController {

    @IBOutlet weak var paleetView: PaletteView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //清屏
    @IBAction func clear(_ sender: Any) {
        self.paleetView.clearScreen()
    }
    //撤销
    @IBAction func undo(_ sender: Any) {
        self.paleetView.undo()
    }
    //橡皮擦
    @IBAction func erasure(_ sender: Any) {
        self.paleetView.erasure()
    }
    //照片相册
    @IBAction func photos(_ sender: Any) {
        let pic = UIImagePickerController.init()
        pic.sourceType = .savedPhotosAlbum
        pic.delegate = self
        self.present(pic, animated: true, completion: nil)
    }
    //保存
    @IBAction func save(_ sender: UIBarButtonItem) {
        UIGraphicsBeginImageContextWithOptions(self.paleetView.bounds.size, false, 0.0)
        
        let ctx = UIGraphicsGetCurrentContext()
        self.paleetView.layer.draw(in: ctx!)
        let newimg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndPDFContext()
        //写入相册
        UIImageWriteToSavedPhotosAlbum(newimg!, self, #selector(image(image:didFinishSavingWithError:contextInfo:)), nil)
    }
    ///此方法apple 要求写死 就这样的格式
    @objc func image(image:UIImage,didFinishSavingWithError error:NSError?,contextInfo:AnyObject) {
        SVProgressHUD.showSuccess(withStatus: "保存成功")
    }

    @IBAction func change(_ sender: UISlider) {
        self.paleetView.setLineWidth(width: CGFloat(sender.value * 10.0))
    }
    
    @IBAction func setColor(_ sender: UIButton) {
        self.paleetView.setLineColorh(color: sender.backgroundColor!)
    }
    
}
extension PaletteController:UIImagePickerControllerDelegate,UINavigationControllerDelegate,HandleImageViewDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let img = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        let handview = HandleImageView.init(frame: self.paleetView.bounds)
        handview.image = img
        handview.delegate = self
        self.paleetView.addSubview(handview)
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func handleImageView(handleImageV: HandleImageView, newImage: UIImage) {
        self.paleetView.image = newImage
    }
}
