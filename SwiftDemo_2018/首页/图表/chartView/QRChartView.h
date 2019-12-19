//
//  QRChartView.h
//  chart
//
//  Created by hou on 2018/1/12.
//  Copyright © 2018年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QRChartView : UIView
@property (nonatomic,strong)NSMutableArray *titleSource;
@property (nonatomic,strong)NSMutableArray *valueSource;
- (void)reloadData;
@end
