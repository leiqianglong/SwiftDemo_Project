//
//  OC_JS_Ctr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/2.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit
import SVProgressHUD
class OC_JS_Ctr: UIViewController,UIWebViewDelegate {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "deal.html", withExtension: nil)
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
    
    //清除广告
    @IBAction func clearAd(_ sender: UIButton) {
        //执行js代码
        self.webview.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('footer')[0].remove();")
         self.webview.stringByEvaluatingJavaScript(from: "document.getElementsByTagName('header')[0].remove();")
    }
    
    @IBAction func getTtitle(_ sender: UIButton) {
       let title = self.webview.stringByEvaluatingJavaScript(from: "document.title;")
    
        QLog(title)
        
    }
    @IBAction func openOther(_ sender: Any) {
        let url = "\"http://m.dianping.com\""
        let htmlStr = "window.open(\(url));"
        self.webview.stringByEvaluatingJavaScript(from:htmlStr)
    }
    @IBAction func nextClick(_ sender: UIButton) {
        let vc = OC_JS_Ctr2()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func nextTwo(_ sender: Any) {
        let vc = OC_JS_Ctr3()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

