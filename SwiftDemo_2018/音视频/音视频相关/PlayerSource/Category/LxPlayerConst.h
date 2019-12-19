//
//  LxPlayerConst.h
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/20.
//  Copyright © 2018年 hou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Masonry/Masonry.h>
#import <AFNetworking/AFNetworking.h>

#import "UILabel+LXLabel.h"
#import "UIColor+Expanded.h"

#import "LxButton.h"

#import "UIView+LX_Frame.h"

#import "LXAVPlayer.h"



@interface LxPlayerConst : NSObject
#define Device_Width  [[UIScreen mainScreen] bounds].size.width//获取屏幕宽高
#define Device_Height [[UIScreen mainScreen] bounds].size.height

#define NAVH (MAX(Device_Width, Device_Height)  == 812 ? 88 : 64)
#define TABBARH (MAX(Device_Width, Device_Height)  == 812 ? 83 : 49)

#define LXColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define LXRandomColor LXColor(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define  Font(f) [UIFont systemFontOfSize:(f)]
#define LXWS(weakSelf)  __weak __typeof(&*self)weakSelf = self
@end
