//
//  QRCollectionViewCell.h
//  chart
//
//  Created by hou on 2018/1/12.
//  Copyright © 2018年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRCollectionViewCell : UICollectionViewCell
/** 柱子 */
@property (nonatomic,strong)UILabel *chartLabel;
/** 标题 */
@property (nonatomic,strong)UILabel *titleLabel;
@end
