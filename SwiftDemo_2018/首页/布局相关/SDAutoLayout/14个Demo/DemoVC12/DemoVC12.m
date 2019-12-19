//
//  DemoVC12.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/19.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "DemoVC12.h"
#import "SDAutoLayout.h"

@interface DemoVC12 ()

@end

@implementation DemoVC12
{
    UIScrollView *_scrollView;
    
    UIView *_flowItemContentView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupScrollView];
}
// 添加scrollview
- (void)setupScrollView
{
    UIScrollView *scroll = [UIScrollView new];
    [self.view addSubview:scroll];
    _scrollView = scroll;
    
    // 设置scrollview与父view的边距
    scroll.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    [self setupFlowItemContentView];
    
    // 设置scrollview的contentsize自适应
    [scroll setupAutoContentSizeWithBottomView:_flowItemContentView bottomMargin:10];
}
// 添加flowItemContentView
- (void)setupFlowItemContentView{
    _flowItemContentView = [UIView new];
    _flowItemContentView.backgroundColor = [[UIColor lightGrayColor] colorWithAlphaComponent:0.4];
    [_scrollView addSubview:_flowItemContentView];
    
    _flowItemContentView.sd_layout
    .leftEqualToView(_scrollView)
    .rightEqualToView(_scrollView)
    .topEqualToView(_scrollView);
    
     [self setupFlowItemViews];
}

- (void)setupFlowItemViews{
    NSMutableArray *temp = [NSMutableArray new];
    for (int i = 0; i < 35; i++) {
        UIView *view = [UIView new];
        view.backgroundColor = [self randomColor];
        [_flowItemContentView addSubview:view];
        view.sd_layout.autoHeightRatio(0.8);
        [temp addObject:view];
    }
    // 关键步骤：设置类似collectionView的展示效果
    [_flowItemContentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:3 verticalMargin:10 horizontalMargin:10 verticalEdgeInset:0 horizontalEdgeInset:0];
}
- (UIColor *)randomColor
{
    CGFloat r = arc4random_uniform(256) / 255.0;
    CGFloat g = arc4random_uniform(256) / 255.0;
    CGFloat b = arc4random_uniform(256) / 255.0;
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}


@end
