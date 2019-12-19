//
//  OC_JS_Ctr2.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/3.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit
import SVProgressHUD

class OC_JS_Ctr2: UIViewController,UIWebViewDelegate {
    @IBOutlet weak var webview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://m.dianping.com/tuan/deal/17314084?from=m_reculike&rec_query_id=9b905245-b793-42a2-b0c1-d124d7534230")
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
    //加载完成之后 删除网页的一些东西
    //OC -> JS
    //webview 一加载就删除导航栏
    let js = NSMutableString(string: "var header = document.getElementsByTagName('header')[0];")
    js.append("header.parentNode.removeChild(header);")
    webview.stringByEvaluatingJavaScript(from: js as String)
}

/**
 *  UIWebView加载失败的时候调用(请求失败)
 */
func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
    SVProgressHUD.dismiss()
}
    
    @IBAction func clearFooter(_ sender: UIButton) {
        //删除脚部
        let js = NSMutableString(string: "var footer = document.getElementsByTagName('footer')[0];")
        js.append("footer.parentNode.removeChild(footer);")
        js.append("var banner = document.getElementsByClassName('footer-btn-fix')[0];")
        js.append("banner.parentNode.removeChild(banner);")
        webview.stringByEvaluatingJavaScript(from: js as String)
    }
    
}
