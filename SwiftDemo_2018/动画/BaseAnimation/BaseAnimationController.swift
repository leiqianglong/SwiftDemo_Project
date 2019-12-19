//
//  BaseAnimationController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/17.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class BaseAnimationController: UITableViewController {

    
    var titles:Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
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
        var vc:UIViewController!
        switch indexPath.row {
        case 0:
            vc = RotationCtr()
        case 1:
            vc = PositionCtr()
        case 2:
            vc = ChangeCtr()
        case 3:
            vc = ScaleCtr()
        case 4:
            vc = SizeCtr()
        case 5:
            vc = KeyFrameCtr()
        case 6:
            vc = TransitionCtr()
        case 7:
            vc = SpringCtr()
        case 8:
            vc = GroupCtr()
        case 9:
            vc = LineController()
        case 10:
            vc = LineController()
        case 11:
            vc = FireCtr()
        case 12:
            vc = FireCtr()
        default:
            break
        }
        
        if indexPath.row == 3 {
            self.present(vc, animated: true, completion: nil)
        }else{
            vc.title = titles[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }

    private func setUpData(){
        titles.append("Rotation")
        titles.append("Position")
        titles.append("Change")
        titles.append("Scale")
        titles.append("Size")
        titles.append("KeyFrame")
        titles.append("Transition")
        titles.append("Spring")
        titles.append("Group")
        titles.append("LineDraw")
        titles.append("WaveLine")
        titles.append("Fire")
        titles.append("FireTow")
      
    }

}
