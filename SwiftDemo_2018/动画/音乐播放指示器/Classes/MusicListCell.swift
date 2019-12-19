//
//  MusicListCell.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/17.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class MusicListCell: UITableViewCell {
    
    
    @IBOutlet weak var musicNumberLabel: UILabel!
    
    @IBOutlet weak var musicTitleLabel: UILabel!
    @IBOutlet weak var musicIndicator: ESTMusicIndicatorView!
    

    var state: ESTMusicIndicatorViewState = .stopped {
        didSet {
            musicIndicator.state = state
            musicNumberLabel.isHidden = state != .stopped
        }
    }
    
    var musicNumber: Int = 1 {
        didSet {
            musicNumberLabel.text = String(musicNumber)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
