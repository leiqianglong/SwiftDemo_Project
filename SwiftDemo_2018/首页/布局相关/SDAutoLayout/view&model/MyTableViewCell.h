//
//  MyTableViewCell.h
//  chart
//
//  Created by hou on 2018/1/15.
//  Copyright © 2018年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoModel.h"

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *contentLab;
@property (nonatomic, strong) DemoModel *model;
@end
