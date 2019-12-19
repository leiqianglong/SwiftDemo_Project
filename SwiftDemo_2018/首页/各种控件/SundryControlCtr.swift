//
//  SundryControlCtr.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/1.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class SundryControlCtr: UITableViewController {

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
            vc = SwichCtr()
        case 1:
            vc = SystemNotiController()
        case 2:
            vc = FloatBtnCtr()
        case 3:
            vc = SliderController()
        case 4:
            vc = InputController()
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
        titles.append("swich控件")
        titles.append("弹出通知条")
        titles.append("悬浮按钮")
        titles.append("slider滑块")
        titles.append("评论回复输入框")

    }

}
