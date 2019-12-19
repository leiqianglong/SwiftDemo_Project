//
//  JS_OC_Ctr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/2.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit
import SVProgressHUD
class JS_OC_Ctr: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = Bundle.main.url(forResource: "test.html", withExtension: nil)
        let urlReqest = URLRequest(url: url!)
        self.webview.loadRequest(urlReqest)
    }

    //MARK - UIWebViewDelegate
    /**
     *  UIWebView开始加载资源的时候调用(开始发送请求)
     */
    func webViewDidStartLoad(_ webView: UIWebView) {
        
        SVProgressHUD.show(withStatus: "正在加载中...")
    }
    
    /**
     *  UIWebView加载完毕的时候调用(请求完毕)
     */
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
        self.title = self.webview.stringByEvaluatingJavaScript(from: "document.title;")
    }
    
    /**
     *  UIWebView加载失败的时候调用(请求失败)
     */
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
    //MARK - UIWebViewDelegate
    /**
     当webView发送一个请求之前都会调用这个方法, 返回YES, 可以加载这个请求, 返回NO, 代表禁止加载这个请求
     */
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {

        let urlStr = (request.url?.absoluteString)! as NSString
        let rang:NSRange = urlStr.range(of: "ios://")
        if rang.length != 0  {
            let method = urlStr.substring(from: rang.location + rang.length)
            let selector = NSSelectorFromString(method)
            self.perform(selector, with: nil)
        }
        return true
    }

    //打开相机
    @objc private func openMyCamera(){
        let ipc = UIImagePickerController.init()
        ipc.sourceType = .camera
        self.present(ipc, animated: true, completion: nil)
    }
    //打开相册
    @objc private func openMyAlbum(){
        let ipc = UIImagePickerController.init()
        ipc.sourceType = .photoLibrary
        self.present(ipc, animated: true, completion: nil)
    }

}
