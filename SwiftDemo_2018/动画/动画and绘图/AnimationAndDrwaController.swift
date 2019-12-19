//
//  AnimationAndDrwaController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2019/1/7.
//  Copyright © 2019 hou. All rights reserved.
//

import UIKit

class AnimationAndDrwaController: UITableViewController {

    var titles = ["基本图形绘制","画图片、雪花","图形上下文","图片水印和裁剪","截屏","手势解锁","画板(涂鸦)"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
         cell.textLabel?.text = titles[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var vc : UIViewController!
        if indexPath.row == 0 {
            vc = BaseGraphController()
        }else if indexPath.row == 1 {
            vc = ImageController()
        }else if indexPath.row == 2 {
            vc = GraphController()
        }else if indexPath.row == 3 {
            vc = MyImageCtr()
        }else if indexPath.row == 4 {
            vc = ScreenShotCtr()
        }else if indexPath.row == 5 {
            vc = GestureUnlockCtr()
        }else if indexPath.row == 6 {
            vc = PaletteController()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
