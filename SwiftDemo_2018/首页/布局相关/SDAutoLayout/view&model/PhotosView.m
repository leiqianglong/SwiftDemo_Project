//
//  PhotosView.m
//  chart
//
//  Created by hou on 2018/1/15.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "PhotosView.h"
#import "UIView+SDAutoLayout.h"
@implementation PhotosView{
    NSMutableArray *_imageViewsArray;
}

-(instancetype)initWithMaxItemsCount:(NSInteger)count{
    if (self = [super init]) {
        self.backgroundColor = [UIColor grayColor];
         self.maxItemsCount = count;
    }
    return self;
}

-(void)setPhotoNamesArray:(NSArray *)photoNamesArray{
     _photoNamesArray = photoNamesArray;
    if (!_imageViewsArray) {
        _imageViewsArray = [NSMutableArray new];
    }
    int needsToAddItemsCount = (int)(_photoNamesArray.count - _imageViewsArray.count);
    
    if (needsToAddItemsCount > 0) {
        
        for (int i = 0; i < needsToAddItemsCount; i++) {
            UIImageView *imageView = [UIImageView new];
            imageView.backgroundColor = [UIColor redColor];
            [self addSubview:imageView];
            [_imageViewsArray addObject:imageView];
        }
    }
     NSMutableArray *temp = [NSMutableArray new];
    
    [_imageViewsArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx < _photoNamesArray.count) {
            imageView.hidden = NO;
            imageView.sd_layout.autoHeightRatio(1);
            imageView.image = [UIImage imageNamed:_photoNamesArray[idx]];
            [temp addObject:imageView];
        }else{
            [imageView sd_clearAutoLayoutSettings];
            imageView.hidden = YES;
        }
    }];
    
     [self setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:3 verticalMargin:10 horizontalMargin:10 verticalEdgeInset:0 horizontalEdgeInset:0];
}
@end
