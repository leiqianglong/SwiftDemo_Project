//
//  CustomerLayout.swift
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/12.
//  Copyright © 2018年 hou. All rights reserved.
//

import UIKit

class CustomerLayout: BaseViewController,UICollectionViewDataSource, UICollectionViewDelegateLeftAlignedLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    let kCellIdentifier = "CellIdentifier"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.backgroundColor = UIColor.clear
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCellIdentifier)
        view.addSubview(self.collectionView)
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return section == 0 ? 20 : 80
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCellIdentifier, for: indexPath)
        
        cell.contentView.layer.borderColor = UIColor.orange.cgColor
        
        cell.contentView.layer.borderWidth = 1.0
        
        cell.contentView.backgroundColor = UIColor(red: returnNumber()/255.0, green: returnNumber()/255.0, blue: returnNumber()/255.0, alpha: 1)
        
        return cell
    }
    private func returnNumber() -> CGFloat{
        return CGFloat(arc4random()%255)+1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let randomWidth:CGFloat = CGFloat((arc4random() % 120) + 60)
        return CGSize(width: randomWidth, height: 40)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return section == 0 ? 15 : 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
         return UIEdgeInsetsMake(10, 10, 10, 10)
    }
}
