//
//  WebViewController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/2.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class WebViewController: UITableViewController {
    var titles = ["webView的基本方法","oc与js交互","js与oc交互"]
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "UITableViewCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellID)
        }
        cell?.textLabel?.text = titles[indexPath.row]
        return cell!
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc : UIViewController!
        switch indexPath.row {
        case 0:
            vc = WebViewBaseFuncCtr()
        case 1:
            vc = OC_JS_Ctr()
        case 2:
            vc = JS_OC_Ctr()
        default:
            break
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
