//
//  QTableHeaderView.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/20.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "QTableHeaderView.h"
#import "SDAutoLayout.h"

@implementation QTableHeaderView
{
    UIImageView *_backgroundImageView;
    UIImageView *_iconView;
    UILabel *_nameLabel;
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUp];
    }
    return self;
}
-(void)setUp{
    //背景图
    _backgroundImageView = [UIImageView new];
    _backgroundImageView.image = [UIImage imageNamed:@"profile_cover_background"];
    [self addSubview:_backgroundImageView];
    
    //头像图片
    _iconView = [UIImageView new];
    _iconView.image = [UIImage imageNamed:@"icon2"];
    [self addSubview:_iconView];
    _iconView.layer.borderWidth = 3;
    _iconView.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    //名字
    _nameLabel = [UILabel new];
    _nameLabel.text = @"神经病";
    _nameLabel.textColor = [UIColor whiteColor];
    [self addSubview:_nameLabel];
    
    //布局约束
    _backgroundImageView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(self, -64)
    .bottomSpaceToView(self, 40);
    

    _iconView.sd_layout
    .widthIs(70)
    .heightEqualToWidth()
    .bottomSpaceToView(self, 15)
    .rightSpaceToView(self, 20);
    
    [_nameLabel setSingleLineAutoResizeWithMaxWidth:0];//设置文本自适应
    _nameLabel.sd_layout
    .rightSpaceToView(_iconView, 5)
    .bottomSpaceToView(_iconView,-35)
    .heightIs(20);
    
}
@end
