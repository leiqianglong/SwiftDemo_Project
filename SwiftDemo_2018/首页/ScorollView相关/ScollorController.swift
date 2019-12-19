//
//  ScollorController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/16.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class ScollorController: UITableViewController {

    var titles:Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        self.navigationItem.title = "scorollView相关"
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
  
        
    }
    private func setUpData(){


    }
}
