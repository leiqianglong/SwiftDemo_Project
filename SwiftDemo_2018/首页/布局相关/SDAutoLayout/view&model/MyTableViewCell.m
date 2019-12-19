//
//  MyTableViewCell.m
//  chart
//
//  Created by hou on 2018/1/15.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "MyTableViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "PhotosView.h"

@interface MyTableViewCell()
@property(nonatomic,strong)PhotosView *photosContainer;
@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.photosContainer = [[PhotosView alloc] initWithMaxItemsCount:9];
    [self.contentView addSubview:self.photosContainer];
    
    self.contentLab.font = [UIFont systemFontOfSize:15];
    self.contentLab.textColor = [UIColor grayColor];
    
    self.icon.sd_layout
    .leftSpaceToView(self.contentView, 10)
    .topSpaceToView(self.contentView, 10)
    .widthIs(50)
    .heightEqualToWidth();
    
    self.contentLab.sd_layout
    .leftSpaceToView(self.icon, 10)
    .topEqualToView(self.icon)
    .rightSpaceToView(self.contentView, 10)
    .autoHeightRatio(0);
    
    self.photosContainer.sd_layout
    .leftEqualToView(self.contentLab)
    .rightEqualToView(self.contentLab)
    .topSpaceToView(self.contentLab, 10);
    
    
}


-(void)setModel:(DemoModel *)model{
    
    _model = model;
    self.contentLab.text = model.title;
    self.icon.image = [UIImage imageNamed:model.iconImagePath];
    self.photosContainer.photoNamesArray = model.imagePathsArray;
    
    [self setupAutoHeightWithBottomView:self.photosContainer bottomMargin:10];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
