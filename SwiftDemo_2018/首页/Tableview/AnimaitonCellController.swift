
//
//  AnimaitonCellController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/2/6.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class AnimaitonCellController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //cell动画
        let temp = Int(arc4random()%10)
        TableViewAnimationKit.show(with: XSTableViewAnimationType(rawValue: temp)!, tableView: tableView)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
 
        cell.textLabel?.text = "swift——2018 Ddmo 第" + String(indexPath.row) + "行"
        
        return cell
    }



}
