//
//  CustomView1.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class CustomView2: UIView,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tabview: UITableView!

    var customView:EBCustomBannerView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.tabview.delegate = self
        self.tabview.dataSource = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 19
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tabview.dequeueReusableCell(withIdentifier: "cell") as? Custom2ViewCell
        if cell == nil {
            cell = Bundle.main.loadNibNamed("Custom2ViewCell", owner: self, options: nil)?.last as? Custom2ViewCell
        }

        cell?.customView = self.customView
        return cell!
    }
}
