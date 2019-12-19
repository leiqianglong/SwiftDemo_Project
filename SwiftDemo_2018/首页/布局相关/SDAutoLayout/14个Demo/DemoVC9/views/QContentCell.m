//
//  QContentCell.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/20.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "QContentCell.h"
#import "SDAutoLayout.h"

@implementation QContentCell
{
    UIImageView *_icon;
    UILabel *_nameLab;
    UILabel *_contentlab;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    
        [self initUI];
    }
    
    return self;
}

-(void)initUI{
    _icon = [UIImageView new];
    _icon.image = [UIImage imageNamed:@"icon2"];
    
    _nameLab = [UILabel new];
    _nameLab.textColor = [UIColor darkGrayColor];
    _nameLab.text = @"邓芬琴";
//    _nameLab.font = [UIFont systemFontOfSize:15];
    
    
    _contentlab = [UILabel new];
    _contentlab.textColor = [UIColor darkGrayColor];
    _contentlab.text = @"沙发上拉丝粉金坷垃打扫房间奥威放假了抛弃我就 安居打扫房间克拉的私家车发牢骚的九分裤拉的屎附近可拉倒设计费卡电视剧";
    _contentlab.font = [UIFont systemFontOfSize:15];
    
    [self sd_addSubviews:@[_icon,_nameLab,_contentlab]];
    
    _icon.sd_layout
    .leftSpaceToView(self, 15)
    .topSpaceToView(self, 15)
    .widthIs(60)
    .heightEqualToWidth();
    
    _nameLab.sd_layout
    .leftSpaceToView(_icon, 10)
    .topEqualToView(_icon)
    .heightIs(20);
    

    CGAffineTransform matrix =CGAffineTransformMake(1, 0, tanf(16 * (CGFloat)M_PI / 180), 1, 0, 0);//设置反射。倾斜角度。
    
    UIFontDescriptor *desc = [ UIFontDescriptor fontDescriptorWithName :[UIFont boldSystemFontOfSize:16].fontName matrix :matrix];//取得系统字符并设置反射。
    
    _nameLab.font = [ UIFont fontWithDescriptor :desc size :16];
    

    _contentlab.sd_layout
    .topSpaceToView(_nameLab, 10)
    .leftEqualToView(_nameLab)
    .rightSpaceToView(self, 10)
    .autoHeightRatio(0);
    
    [_nameLab setSingleLineAutoResizeWithMaxWidth:0];
    
    [self setupAutoHeightWithBottomView:_contentlab bottomMargin:10];
    
}
@end
