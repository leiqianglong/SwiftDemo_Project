//
//  UICollecViewCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class UICollecViewCtr: UITableViewController {

    var titles:Array = [String]()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        setUpData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
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
        let vcCtr = CustomerLayout()
        vcCtr.title = titles[indexPath.row]
        self.navigationController?.pushViewController(vcCtr, animated: true)
    }
    private func setUpData(){
        titles.append("靠左标签布局")

    }
}
