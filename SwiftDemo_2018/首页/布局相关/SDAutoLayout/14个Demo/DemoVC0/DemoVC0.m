//
//  DemoVC0.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/18.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "DemoVC0.h"
#import "SDAutoLayout.h"

#define kTimeInterval 1.0


@interface DemoVC0 ()

@end

@implementation DemoVC0
{
    NSTimer *_timer;
    CGFloat _widthRatio;
    CGFloat _widthR;
    CGFloat _fontSize;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpConfige];
}
-(void)setUpConfige{
    _widthRatio = 0.4;
    _widthR = 100;
    _fontSize = 15;
    _timer = [NSTimer scheduledTimerWithTimeInterval:kTimeInterval target:self selector:@selector(animation) userInfo:nil repeats:YES];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view0.sd_layout
    .leftSpaceToView(self.view,20)
    .topSpaceToView(self.view, 80)
    .heightIs(130)
    .widthRatioToView(self.view, _widthRatio);
    
    
    self.view1.sd_layout
    .leftSpaceToView(self.view0, 10)
    .topEqualToView(self.view0)
    .heightIs(60)
    .widthRatioToView(self.view0, 0.5);
    
    self.view2.sd_layout
    .leftSpaceToView(self.view1, 10)
    .topEqualToView(self.view1)
    .heightRatioToView(self.view1, 1)
    .widthIs(50);
    
    self.view3.sd_layout
    .leftEqualToView(self.view1)
    .topSpaceToView(self.view1, 10)
    .heightRatioToView(self.view1, 1)
    .widthRatioToView(self.view1, 1);
    
    self.view4.sd_layout
    .leftEqualToView(self.view2)
    .topEqualToView(self.view3)
    .heightRatioToView(self.view3, 1)
    .widthRatioToView(self.view2, 1);
    
    [self.view0 addSubview:self.view5];
    self.view5.sd_layout
    .centerYEqualToView(self.view0)
    .rightSpaceToView(self.view0, 10)
    .widthRatioToView(self.view0, 0.5)
    .heightIs(20);
    
    self.conerView = [[UIView alloc]init];
    self.conerView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.conerView];
    self.conerView.layer.cornerRadius = 50;
    self.conerView.layer.masksToBounds = YES;
    self.conerView.sd_layout
    .leftSpaceToView(self.view, 50)
    .topSpaceToView(self.view0, 50)
    .widthIs(_widthR)
    .heightEqualToWidth();
    
    self.contetnLab = [[UILabel alloc]init];
    self.contetnLab.backgroundColor = [UIColor redColor];
    self.contetnLab.textColor = [UIColor whiteColor];
    self.contetnLab.text = @"我是个文本";
    self.contetnLab.textAlignment = NSTextAlignmentCenter;
    self.contetnLab.font = [UIFont systemFontOfSize:_fontSize];
    [self.conerView addSubview:self.contetnLab];
    self.contetnLab.sd_layout
    .centerYEqualToView(self.conerView)
    .leftSpaceToView(self.conerView, 0)
    .widthRatioToView(self.conerView, 1)
    .heightIs(30);
    
}
- (void)animation
{
    if (_widthRatio >= 0.4) {
        _widthRatio = 0.1;
        _widthR = 60;
    } else {
        _widthRatio = 0.4;
        _widthR = 100;
    }
    
    // 开启动画
    [UIView animateWithDuration:1.0 animations:^{
        self.view0.sd_layout
        .widthRatioToView(self.view, _widthRatio);
        [self.view0 updateLayout]; // 调用此方法开启view0动画效果
        [self.view5 updateLayout]; // 调用此方法开启view5动画效果
//        /*
//         调用[self.view0 updateLayout]就可以实现view0和其它兄弟view一起动画，view0和view5是父子关系，如果view0需要动画要再主动调用一次[self.view5 updateLayout]
//         */

        self.conerView.sd_layout
        .widthIs(_widthR)
        .heightEqualToWidth();
         self.conerView.layer.cornerRadius = _widthR*0.5;
        [self.conerView updateLayout];
        [self.contetnLab updateLayout];
    }];
    

    
}
- (void)viewDidDisappear:(BOOL)animated
{
    [_timer invalidate];
    _timer = nil;
}

@end
