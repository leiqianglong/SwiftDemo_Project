//
//  DemoVC1.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/18.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "DemoVC1.h"
#import "SDAutoLayout.h"

@interface DemoVC1 ()

@end

@implementation DemoVC1
{
    UILabel *_autoWidthLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
    
    // demo1.内容自适应view
    [self setupAutoHeightView];
    // demo2.宽度自适应label
    [self setupAutoWidthLabel];
    // demo3.高度自适应label
    [self setupAutoHeightLabel];
    
    // demo4.设置button根据文字size自适应
    [self setupAutoSizeButton];
}

- (void)setupAutoHeightView {
    /*
     设置view1高度根据子view而自适应(在view1中加入两个子view(testLabel和testView)
     ，然后设置view1高度根据子view内容自适应)
     */
 
    UILabel *subview1 = [UILabel new]; // 初始化子view1
    subview1.text = @"这个紫色的label会根据这些文字内容高度自适应；而这个灰色的父view会根据紫色的label和橙色的view具体情况实现高度自适应。\nGot it! OH YAEH!";
    subview1.backgroundColor = [UIColor purpleColor];
    
    UIView *subview2 = [UIView new];    // 初始化子view2
    subview2.backgroundColor = [UIColor orangeColor];
    [self.view1 sd_addSubviews:@[subview1,subview2]];
    
    subview1.sd_layout
    .leftSpaceToView(self.view1, 10)
    .rightSpaceToView(self.view1, 10)
    .topSpaceToView(self.view1, 10)
    .autoHeightRatio(0);// 设置文本内容自适应，如果这里的参数为大于0的数值则会以此数值作为view的高宽比设置view的高度
    
    
    subview2.sd_layout
    .topSpaceToView(subview1, 10)
    .widthRatioToView(subview1, 1)
    .heightIs(30)
    .leftEqualToView(subview1);
    
    
    self.view1.sd_layout
    .leftSpaceToView(self.view, 10)
    .topSpaceToView(self.view, 80)
    .rightSpaceToView(self.view, 10);
    
    // 设置view1高度根据子其内容自适应
    [self.view1 setupAutoHeightWithBottomView:subview2 bottomMargin:10];
    
}

// demo2.宽度自适应label
- (void)setupAutoWidthLabel{
    UILabel *autoWidthlabel = [UILabel new];
    autoWidthlabel.backgroundColor = [[UIColor orangeColor] colorWithAlphaComponent:0.5];
    _autoWidthLabel = autoWidthlabel;
    autoWidthlabel.font = [UIFont systemFontOfSize:12];
    autoWidthlabel.text = @"宽度自适应(距离父view右边距10)";
     [self.view addSubview:autoWidthlabel];
    autoWidthlabel.sd_layout
    .rightSpaceToView(self.view, 15)
    .heightIs(20)
    .bottomSpaceToView(self.view, 20);
    
    [autoWidthlabel setSingleLineAutoResizeWithMaxWidth:0];//这里传 0 根据文字单行自适应
}
// demo3.高度自适应label
- (void)setupAutoHeightLabel{
    UILabel *autoHeightlabel = [UILabel new];
    autoHeightlabel.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.5];
    autoHeightlabel.font = [UIFont systemFontOfSize:12];
    autoHeightlabel.text = @"高度自适应(距离父view左边距10，底部和其右侧label相同，宽度为100)";
    
    [self.view addSubview:autoHeightlabel];
    
    autoHeightlabel.sd_layout
    .bottomEqualToView(_autoWidthLabel)
    .leftSpaceToView(self.view, 10)
    .widthIs(100)
    .autoHeightRatio(0);
    
    UIImageView *imageV = [[UIImageView alloc]init];
    imageV.image = [UIImage imageNamed:@"icon2"];
    [self.view addSubview:imageV];
    
    imageV.sd_layout
    .bottomSpaceToView(autoHeightlabel, 10)
    .leftEqualToView(autoHeightlabel)
    .widthIs(80)
    .heightEqualToWidth();
    
}
// demo4.设置button根据文字size自适应
- (void)setupAutoSizeButton{
    UIButton *btn = [UIButton new];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"button根据文字自适应" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.view1, 20);
    
    [btn setupAutoSizeWithHorizontalPadding:10 buttonHeight:25];
}
@end
