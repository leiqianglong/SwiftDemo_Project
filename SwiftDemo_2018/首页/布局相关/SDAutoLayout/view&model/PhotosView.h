//
//  PhotosView.h
//  chart
//
//  Created by hou on 2018/1/15.
//  Copyright © 2018年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosView : UIView
- (instancetype)initWithMaxItemsCount:(NSInteger)count;
@property (nonatomic, strong) NSArray *photoNamesArray;

@property (nonatomic, assign) NSInteger maxItemsCount;
@end
