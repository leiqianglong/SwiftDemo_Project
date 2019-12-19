//
//  LiveViewController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/15.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class LiveViewController: UITableViewController {

     var titles:Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        //初始化数据
        setUpData()
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
            vc = Live_Demo1()
        case 1:
            vc = DanMuController()
        case 2:
            vc = ApplaudCtr()
        case 3:
            vc = Live_DemoCtr()
        default:
            break
        }
        
        vc.title = titles[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
    private func setUpData(){
        titles.append("直播跑车动画")
        titles.append("直播弹幕")
        titles.append("直播鼓掌动画")
        titles.append("直播送礼物")

    }
}
