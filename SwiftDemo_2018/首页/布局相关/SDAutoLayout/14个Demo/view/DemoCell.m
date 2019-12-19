//
//  DemoCell.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/18.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "DemoCell.h"
#import "UIView+SDAutoLayout.h"

@implementation DemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setup];
    }
    return self;
}

-(void)setup{

    UILabel *titleLabel = [UILabel new];
    titleLabel.textColor = [UIColor grayColor];
    titleLabel.font = [UIFont systemFontOfSize:15];
    [self.contentView addSubview:titleLabel];
    self.titleLab = titleLabel;

    
    UILabel *contentLabel = [UILabel new];
    contentLabel.textColor = [UIColor lightGrayColor];
    contentLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:contentLabel];
    self.contentLab = contentLabel;

    CGFloat margin = 10;

    self.titleLab.sd_layout
    .leftSpaceToView(self.contentView, margin)
    .topSpaceToView(self.contentView, margin)
    .rightSpaceToView(self.contentView, margin)
    .heightIs(20);

    self.contentLab.sd_layout
    .leftEqualToView(self.titleLab)
    .rightEqualToView(self.titleLab)
    .topSpaceToView(self.titleLab, margin)
    .autoHeightRatio(0);

    [self setupAutoHeightWithBottomView:self.contentLab bottomMargin:margin];

}

@end
