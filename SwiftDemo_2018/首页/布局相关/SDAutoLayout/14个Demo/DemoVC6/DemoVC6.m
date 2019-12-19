//
//  DemoVC6.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/19.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "DemoVC6.h"
#import "SDAutoLayout.h"

@interface DemoVC6 ()
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation DemoVC6

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIScrollView *scrollView = [UIScrollView new];
    [self.view addSubview:scrollView];
    
    [scrollView sd_addSubviews:@[self.view0, self.view1, self.view2, self.view3, self.view4, self.view5, self.view6, self.view7, self.view8]];
    
    scrollView.sd_layout.spaceToSuperView(UIEdgeInsetsZero);
    
    self.view0.sd_layout
    .leftSpaceToView(scrollView, 20)
    .rightSpaceToView(scrollView, 20)
    .topSpaceToView(scrollView, 20)
    .heightIs(150);
    
    self.view1.sd_layout
    .widthIs(200)
    .heightEqualToWidth()
    .centerXEqualToView(scrollView)
    .topSpaceToView(self.view0, 20);
    
    self.view2.sd_layout
    .leftSpaceToView(scrollView, 50)
    .rightSpaceToView(scrollView, 50)
    .topSpaceToView(self.view1, 20)
    .heightEqualToWidth(150);
    
    self.view3.sd_layout
    .widthIs(250)
    .heightEqualToWidth()
    .centerXEqualToView(scrollView)
    .topSpaceToView(self.view2, 20);
    
    [scrollView setupAutoContentSizeWithBottomView:self.view3 bottomMargin:20];
    
    //设置圆角
    self.view0.sd_cornerRadiusFromHeightRatio = @(0.5);

    self.view1.sd_cornerRadiusFromWidthRatio = @(0.5);
    
    self.view2.sd_cornerRadiusFromWidthRatio = @(0.5);
    
}



@end
