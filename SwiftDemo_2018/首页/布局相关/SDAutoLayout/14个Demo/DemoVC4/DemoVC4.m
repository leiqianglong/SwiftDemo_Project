//
//  DemoVC4.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/19.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "DemoVC4.h"

@interface DemoVC4 ()

@end

@implementation DemoVC4

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //  --------- attributedString测试：行间距为8 ---------------------------
    
    NSString *text = @"attributedString测试：行间距为8。彩虹网络卡福利费绿调查开房；卡法看得出来分开了的出口来反馈率打开了房；快烦死了；了； 调查开房；；v单纯考虑分离开都快来反馈来看发v离开的积分房积分jdhflgfkkvvm.cm。attributedString测试：行间距为8。彩虹网络卡福利费绿调查开房；卡法看得出来分开了的出口来反馈率打开了房；快烦死了；了； 调查开房；；v单纯考虑分离开都快来反馈来看发v离开的积分房积分jdhflgfkkvvm.cm。";
    
    NSMutableParagraphStyle *pstyel = [[NSMutableParagraphStyle alloc]init];
    [pstyel setLineSpacing:8];
    UIColor *color = [UIColor blackColor];
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:text attributes:@{NSForegroundColorAttributeName : color, NSParagraphStyleAttributeName: pstyel}];
    
    UILabel *label = [UILabel new];
    [self.view addSubview:label];
    
    label.attributedText = string;
    label.sd_layout
    .leftSpaceToView(self.view, 10)
    .rightSpaceToView(self.view, 10)
    .topSpaceToView(self.view, 70)
    .autoHeightRatio(0);
    
     // 标注lable的text为attributedString
    label.isAttributedContent = YES;
    
}

@end
