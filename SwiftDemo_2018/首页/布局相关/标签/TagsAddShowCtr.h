//
//  TagsAddShowCtr.h
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/1.
//  Copyright © 2018年 hou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TagsAddShowCtr;

@protocol ViewControllerDelegate <NSObject>
@optional

- (void)updateTagsLabelWithTagsString:(NSString *)tags;

@end

@interface TagsAddShowCtr : UIViewController

@property (nonatomic ,strong)NSString *bqlabStr;

@property (weak, nonatomic) id <ViewControllerDelegate> delegate;


@end
