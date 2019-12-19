//
//  KernelAnimationCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/8.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class KernelAnimationCtr: UITableViewController {
    var titles:Array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        setUpData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
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
        
        var vc : UIViewController!
        switch indexPath.row {
        case 0:
            vc = CALyerCtr()
        case 1:
            vc = AnimationCtr()
        case 2:
            vc = AnimationGrouopsCtr()
        case 3:
            vc = WheelController()
        case 4:
            vc = PicFoldCtr()
        case 5:
            vc = MusicController()
        case 6:
            vc = InvertedPicCtr()
        case 7:
            vc = GranuleController()
        case 8:
            vc = ElasticityController()

        default:
            break
        }
        vc.title = titles[indexPath.row]
      
        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func setUpData(){
        
        titles.append("CALyer基本操作")
        titles.append("转场动画")
        titles.append("动画组")
        titles.append("幸运大转盘")
        titles.append("图片折叠")
        titles.append("音乐振动条")
        titles.append("倒影")
        titles.append("粒子效果")
        titles.append("qq弹性布局")
        
    }

}
