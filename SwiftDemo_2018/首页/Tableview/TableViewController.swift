//
//  TableViewController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/2/6.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit


class TableViewController: UITableViewController {

    var titles = ["cell动画","微博个人主页","下拉菜单"]

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")

    }

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
            vc = AnimaitonCellController()
        case 1:
            vc = UserCenterViewController()
        case 2:
            vc = DropListController()
        default:
            break
        }
        vc.title = titles[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
