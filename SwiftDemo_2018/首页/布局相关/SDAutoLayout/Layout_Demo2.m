//
//  Layout_Demo2.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/17.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "Layout_Demo2.h"
#import "UIView+SDAutoLayout.h"

@interface Layout_Demo2 (){
    UIScrollView *_scrollView;
    
    UIView *_flowItemContentView;
}

@end

@implementation Layout_Demo2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupScrollView];
}
// 添加scrollview
- (void)setupScrollView
{
    UIScrollView *scroll = [[UIScrollView alloc]init];
    [self.view addSubview:scroll];
    _scrollView = scroll;
    //设置scollview与父view边距
    scroll.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    [self setupFlowItemContentView];
    //设置scrollview的contentsize自适应
    [scroll setupAutoContentSizeWithBottomView:_flowItemContentView bottomMargin:10];
    
}
// 添加flowItemContentView
- (void)setupFlowItemContentView{
    _flowItemContentView = [UIView new];
    _flowItemContentView.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.4];
    [_scrollView addSubview:_flowItemContentView];
    
    _flowItemContentView.sd_layout
    .leftEqualToView(_scrollView)
    .rightEqualToView(_scrollView)
    .topEqualToView(_scrollView);
    
    [self setupFlowItemViews];
    
}

- (void)setupFlowItemViews
{
    NSMutableArray *temp = [NSMutableArray new];
    
    for (int i = 0; i < 35; i++) {
        UILabel *lab = [[UILabel alloc]init];
        lab.backgroundColor = [UIColor greenColor];
        [_flowItemContentView addSubview:lab];
        lab.sd_layout.autoHeightRatio(0.8);
        [temp addObject:lab];
    }
    // 关键步骤：设置类似collectionView的展示效果
    [_flowItemContentView setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:3 verticalMargin:10 horizontalMargin:10 verticalEdgeInset:0 horizontalEdgeInset:0];
}
@end
