//
//  String-extension.swift
//  GesturePasswordView
//
//  Created by liuchunchao on 2018/1/10.
//  Copyright © 2018年 hi-wallet. All rights reserved.
//

import UIKit

extension String {
    
    public func substring(from index: Int) -> String {
        if self.count > index {
            let startIndex = self.index(self.startIndex, offsetBy: index)
            let subString = self[startIndex..<self.endIndex]
            return String(subString)
        } else {
            return self
        }
    }
    public func substring(to index: Int) -> String {
        if self.count > index {
            let endindex = self.index(self.startIndex, offsetBy: index)
            let subString = self[self.startIndex..<endindex]
            return String(subString)
        } else {
            return self
        }
    }
    
    
}
