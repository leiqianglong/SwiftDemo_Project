//
//  AnimationController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/3/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class AnimationController: UITableViewController {

    var titles:Array = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "动画相关"
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
            vc = BaseAnimationController()
        case 1:
            vc = BethelPathCtr()
        case 2:
            vc = DingCtr()
        case 3:
            vc = MusiceIndicatorCtr()
        case 4:
            vc = AnimationAndDrwaController()
        case 5:
            vc = KernelAnimationCtr()
        case 6:
            vc = SinaController()
        case 7:
            vc = PushAnimationController()
        default:
            break
        }
        vc.title = titles[indexPath.row]

        self.navigationController?.pushViewController(vc, animated: true)
    }
    private func setUpData(){

        titles.append("基本动画")
        titles.append("贝塞尔曲线")
        titles.append("模仿钉钉")
        titles.append("音乐指示器")
        titles.append("动画And绘图（Apple原生）")
        titles.append("核心动画")
        titles.append("微博动画")
        titles.append("导航控制器的动画")
 
        initClock()
    }
}
@available(iOS 10.0, *)
extension AnimationController{

    func initClock() {
        let headView = UIView.init(frame: CGRect(x: 0, y: 0, width: KscreenWidth, height: 100))
        headView.backgroundColor = UIColor.white
        let iimg = MyClockView.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        iimg.center = headView.center
        headView.addSubview(iimg)
        self.tableView.tableHeaderView = headView
    }
  
}
