//
//  DBTabViewCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/2.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class DBTabViewCtr: UITableViewController {

    var titles = ["数据库-swift版","数据库-oc版","FMDB存对象"]
    
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
        
    }

}
