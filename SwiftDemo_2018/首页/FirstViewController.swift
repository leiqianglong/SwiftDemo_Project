//
//  FirstViewController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/20.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

@available(iOS 10.0, *)
class FirstViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var titles:Array = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTitleArr()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = self.titles[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        var vc:UIViewController!
        switch indexPath.row {
        case 0:
            vc = ChartController(style: UITableViewStyle.plain)
        case 1:
            vc = LayoutController(style: UITableViewStyle.plain)
        case 2:
            vc = GessturePasswordCtr()
        case 3:
            vc = TabBarViewController()
        case 4:
            vc = TableViewController(style: UITableViewStyle.plain)
        case 5:
            vc = SundryControlCtr(style: UITableViewStyle.plain)
        case 6:
            vc = UICollecViewCtr(style: UITableViewStyle.plain)
        case 7:
            vc = ScollorController()
        case 8:
            vc = DBTabViewCtr()
        case 9:
            vc = WebViewController()
        default:
            break
        }
        vc.title = self.titles[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func setUpTitleArr() -> Void {
        titles.append("图表相关")
        titles.append("布局相关")
        titles.append("手势密码")
        titles.append("自定义TabBar")
        titles.append("Tableview相关")
        titles.append("控件相关")
        titles.append("UICollectionView相关")
        titles.append("scorollView相关")
        titles.append("数据库")
        titles.append("UIWebView")
    }


}
