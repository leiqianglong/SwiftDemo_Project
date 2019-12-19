//
//  WebViewBaseFuncCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/2.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit
import SVProgressHUD

class WebViewBaseFuncCtr: UIViewController,UIWebViewDelegate,UISearchBarDelegate {
    @IBOutlet weak var myWebView: UIWebView!
    @IBOutlet weak var backItem: UIBarButtonItem!
    
    @IBOutlet weak var goItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "网页"
        
        let searchBar = UISearchBar.init(frame: CGRect(x: 0, y: 0, width: 300, height:40))
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        
        let url = URL(string: "http://www.baidu.com")
        let urlReqest = URLRequest(url: url!)
        self.myWebView.loadRequest(urlReqest)

        self.myWebView.dataDetectorTypes = .all //设置需要检测的数据类型
        self.myWebView.scalesPageToFit = true
        
    }
 
    @IBAction func loadHtml() {
        let url = Bundle.main.url(forResource: "deal.html", withExtension: nil)
        showWebView(url: url!)
    }
    @IBAction func loadPdf() {
        let url = Bundle.main.url(forResource: "iOS 7 Cookbook.pdf", withExtension: nil)
        showWebView(url: url!)
    }
    @IBAction func loadWord() {
        let url = Bundle.main.url(forResource: "华为编程规范.doc", withExtension: nil)
        showWebView(url: url!)
    }
    @IBAction func loadTxt() {
        let url = Bundle.main.url(forResource: "关于.txt", withExtension: nil)
        showWebView(url: url!)
    }
    @IBAction func loadMp4() {
        let url = Bundle.main.url(forResource: "minion.mp4", withExtension: nil)
        showWebView(url: url!)
    }
    func showWebView(url:URL){
        let urlReqest = URLRequest(url: url)
        self.myWebView.loadRequest(urlReqest)
    }
    //回退
    @IBAction func goBack(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    //前进
    @IBAction func goForward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
    //MARK - UIWebViewDelegate
    /**
     *  UIWebView开始加载资源的时候调用(开始发送请求)
     */
    func webViewDidStartLoad(_ webView: UIWebView) {
   
        SVProgressHUD.show(withStatus: "正在加载中...")
        //控制前进和 回退按钮的可用性
        self.backItem.isEnabled = myWebView.canGoBack
        self.goItem.isEnabled = myWebView.canGoForward
    }
    
    /**
     *  UIWebView加载完毕的时候调用(请求完毕)
     */
    func webViewDidFinishLoad(_ webView: UIWebView) {
       SVProgressHUD.dismiss()
    }
    
    /**
     *  UIWebView加载失败的时候调用(请求失败)
     */
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
    
    //MARK --- UISearchBarDelegate
    /**
     *  搜索框的文字改变了
     */
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
    
    /**
     *  点击了"搜索"按钮
     */
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // 开始加载网页
        let url = URL(string: "http://" + searchBar.text!)
        let urlreq = URLRequest(url: url!)
        myWebView.loadRequest(urlreq)
    }
    
}
