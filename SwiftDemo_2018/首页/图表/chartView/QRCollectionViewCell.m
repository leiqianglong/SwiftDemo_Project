//
//  QRCollectionViewCell.m
//  chart
//
//  Created by hou on 2018/1/12.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "QRCollectionViewCell.h"
#import "UIColor+get_FFFFFFcolor.h"
#import "SDAutoLayout.h"

@interface QRCollectionViewCell()
@property (nonatomic,strong)UILabel *lineLabel;
@end

@implementation QRCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
        [self.contentView addSubview:self.chartLabel];
        [self.contentView addSubview:self.titleLabel];
        [self.contentView addSubview:self.lineLabel];
        [self layout];
    }
    return self;
}


//布局
- (void)layout {


    self.titleLabel.sd_layout.leftEqualToView(self.contentView).rightEqualToView(self.contentView).bottomEqualToView(self.contentView).heightIs(self.contentView.width);
    self.lineLabel.sd_layout.leftEqualToView(self.contentView).rightEqualToView(self.contentView).bottomSpaceToView(self.titleLabel, 0).heightIs(1);
    
     self.chartLabel.sd_layout.leftSpaceToView(self.contentView, 10).rightSpaceToView(self.contentView, 10).bottomSpaceToView(self.lineLabel, 0).heightIs(90);
    

}
//标题
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        self.titleLabel = [UILabel new];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textColor = [UIColor colorWithHexString:@"8963344"];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.text = @"净值为";
    }
    return _titleLabel;
}
//柱子
- (UILabel *)chartLabel{
    if (!_chartLabel) {
        self.chartLabel = [UILabel new];
        self.chartLabel.backgroundColor = [UIColor colorWithHexString:@"667ECD"];
        self.chartLabel.textAlignment = NSTextAlignmentRight;
        self.chartLabel.font = [UIFont systemFontOfSize:10];
        self.chartLabel.textColor = [UIColor whiteColor];
    }
    return _chartLabel;
}
- (UILabel *)lineLabel {
    if (!_lineLabel) {
        self.lineLabel = [UILabel new];
        self.lineLabel.backgroundColor = [UIColor colorWithHexString:@"8963344"];
    }
    return _lineLabel;
}
@end
