//
//  LayoutController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/17.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class LayoutController: UITableViewController {

    var titles:Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        //初始化数据
        setUpData()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        cell.textLabel?.text = titles[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc : UIViewController!
        switch indexPath.row {
        case 0:
            vc = SDAutoLayout_Demo()
        case 1:
            vc = SnapKitController()
        case 2:
            vc = DLTBImitationViewController()
        case 3:
            vc = AddorShowController()
        default:
            break
        }
        vc.title = titles[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func setUpData(){
        titles.append("SDAutoLayout布局")
         titles.append("SnapKit布局")
        titles.append("类似淘宝详情")
        titles.append("标签添加与展示")
    }
}
