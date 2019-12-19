//
//  Custom2ViewCell.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class Custom2ViewCell: UITableViewCell {

    var customView:EBCustomBannerView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func close(_ sender: Any) {
        self.customView?.hide()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
