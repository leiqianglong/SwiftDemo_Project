//
//  SnapKitController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/17.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class SnapKitController: UITableViewController {

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
        let vcCtr = SimplenesCtr()
        vcCtr.title = titles[indexPath.row]
        self.navigationController?.pushViewController(vcCtr, animated: true)
    }
    private func setUpData(){
        titles.append("SnapKit动画")
   
    }


}
