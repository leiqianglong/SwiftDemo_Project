//
//  TestCell2.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/19.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "TestCell2.h"
#import "SDAutoLayout.h"

@implementation TestCell2
{
    UIView *_view0;
    UIView *_view1;
    UILabel *_view2;
    UIView *_view3;
    UIView *_view4;
    UIView *_view5;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UIImageView *view0 = [UIImageView new];
        view0.image = [UIImage imageNamed:@"icon2"];
        view0.backgroundColor = [UIColor redColor];
        _view0 = view0;
        
        UIView *view1 = [UIView new];
        view1.backgroundColor = [UIColor grayColor];
        _view1 = view1;
        
        UILabel *view2 = [UILabel new];
        view2.backgroundColor = [UIColor brownColor];
        _view2 = view2;
        
        UILabel *view3 = [UILabel new];
        view3.backgroundColor = [UIColor orangeColor];
        _view3 = view3;
        
        UIView *view4 = [UIView new];
        view4.backgroundColor = [UIColor purpleColor];
        _view4 = view4;
        
        UIView *view5 = [UIView new];
        view5.backgroundColor = [UIColor yellowColor];
        _view5 = view5;
        
         [self.contentView sd_addSubviews:@[view0, view1, view2, view3, view4, view5]];
        
        _view0.sd_layout
        .widthIs(50)
        .heightEqualToWidth()
        .topSpaceToView(self.contentView, 10)
        .leftSpaceToView(self.contentView, 10);
        
        _view1.sd_layout
        .topEqualToView(_view0)
        .leftSpaceToView(_view0, 10)
        .rightSpaceToView(self.contentView, 10)
        .heightRatioToView(_view0, 0.4);
        
        _view2.sd_layout
        .topSpaceToView(_view1, 10)
        .rightSpaceToView(self.contentView, 60)
        .leftEqualToView(_view1)
        .autoHeightRatio(0);
        
        _view3.sd_layout
        .topEqualToView(_view2)
        .leftSpaceToView(_view2, 10)
        .heightRatioToView(_view2, 1)
        .rightEqualToView(_view1);
        
        _view4.sd_layout
        .leftEqualToView(_view2)
        .topSpaceToView(_view2, 10)
        .heightIs(30)
        .widthRatioToView(_view1, 0.7);
        
        _view5.sd_layout
        .leftSpaceToView(_view4, 10)
        .rightSpaceToView(self.contentView, 10)
        .bottomSpaceToView(self.contentView, 10)
        .heightRatioToView(_view4, 1);
        
        [self setupAutoHeightWithBottomView:_view4 bottomMargin:10];
    }
    return self;
}

-(void)setText:(NSString *)text{
    _text = text;
    _view2.text = text;
}
@end
