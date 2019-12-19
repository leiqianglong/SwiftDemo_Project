//
//  DemoModel.h
//  chart
//
//  Created by hou on 2018/1/15.
//  Copyright © 2018年 hou. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoModel : NSObject
@property (nonatomic, copy) NSString *iconImagePath;
@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *imagePathsArray;
@end
