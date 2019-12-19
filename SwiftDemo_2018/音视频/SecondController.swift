//
//  SecondController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/20.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class SecondController: UITableViewController {

    var titles:Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitleArr()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.titles[indexPath.row]
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var vc:UIViewController!
        switch indexPath.row {
        case 0:
           vc = LiveViewController()
        case 1:
            vc = QRTableViewCtr()
        case 2:
            vc = AudioPlayCtr()
        case 3:
            vc = RecordViewController()
        default:
            break
        }
        vc.title = self.titles[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpTitleArr() -> Void {
        titles.append("直播相关")
        titles.append("音视频相关")
        titles.append("音视播放器")
        titles.append("录音功能")
    }

   
}
