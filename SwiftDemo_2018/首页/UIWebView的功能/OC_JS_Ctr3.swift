//
//  OC_JS_Ctr3.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/3.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit
import SVProgressHUD

class OC_JS_Ctr3: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        let webview = UIWebView.init(frame: view.bounds)
        webview.delegate = self
        self.view.addSubview(webview)
        let url = Bundle.main.url(forResource: "login.html", withExtension: nil)
        let urlReqest = URLRequest(url: url!)
        webview.loadRequest(urlReqest)
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
        self.title = webView.stringByEvaluatingJavaScript(from: "document.title;")
    }
    
    /**
     *  UIWebView加载失败的时候调用(请求失败)
     */
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
  

}
