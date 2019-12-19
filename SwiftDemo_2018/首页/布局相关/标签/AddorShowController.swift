//
//  AddorShowController.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/1.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class AddorShowController: BaseViewController,ViewControllerDelegate {

    @IBOutlet weak var labs: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func oneBtn(_ sender: Any) {
        let tgvc = TagsAddShowCtr()
        tgvc.delegate = self
        tgvc.bqlabStr = labs.text
        self.navigationController?.pushViewController(tgvc, animated: true)
        
    }

    @IBAction func secBtn(_ sender: Any) {
        let onevc = TagOneController()
        onevc.isAdd = true
        self.navigationController?.pushViewController(onevc, animated: true)
    }
    
    @IBAction func treBtn(_ sender: Any) {
        let onevc = TagOneController()
        onevc.isAdd = false
        self.navigationController?.pushViewController(onevc, animated: true)
    }
    func updateTagsLabel(withTagsString tags: String!) {
        self.labs.text = tags
    }
}
