//
//  TabBarViewController.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/20.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "TabBarViewController.h"
#import "CustomTabBarCtr.h"
#import "JMConfig.h"
#import "JMTabBarController.h"
@interface TabBarViewController ()

@end

@implementation TabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    //初始化标题数组, 未选择图片数组, 选择图片数组, 控制器数组
    NSMutableArray *titleArr = [NSMutableArray arrayWithObjects:@"首页",@"热点",@"doki",@"个人中心", nil];
    NSMutableArray *imageNormalArr = [NSMutableArray arrayWithObjects:@"tab1_nor",@"tab2_nor",@"tab3_nor",@"tab4_nor", nil];
    NSMutableArray *imageSelectedArr = [NSMutableArray arrayWithObjects:@"tab1_sel",@"tab2_sel",@"tab3_sel",@"tab4_sel", nil];
    NSMutableArray *controllersArr = [NSMutableArray array];
    for (int i = 0; i < titleArr.count; i++) {
        
        if (i == 0) {
            CustomTabBarCtr *vc = [[CustomTabBarCtr alloc] init];
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            [controllersArr addObject:nav];
        } else {
            UIViewController *vc = [[UIViewController alloc] init];
            vc.view.backgroundColor = kRandomColor;
            UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
            
            [controllersArr addObject:nav];
        }
    }
    
    //初始化配置信息
    JMConfig *config = [JMConfig config];

    JMTabBarController *tabBarVc = [[JMTabBarController alloc] initWithTabBarControllers:controllersArr NorImageArr:imageNormalArr SelImageArr:imageSelectedArr TitleArr:titleArr Config:config];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.imageEdgeInsets = UIEdgeInsetsMake(-20, 0, 0, 0);
    [btn setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [config addCustomBtn:btn AtIndex:2 BtnClickBlock:^(UIButton *btn, NSInteger index) {
        JMLog(@"点击了我");
        UIViewController *vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = [UIColor orangeColor];
        [[JMConfig config].tabBarController presentViewController:vc animated:YES completion:nil];
        
        //测试代码 (两秒后自动关闭)
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [vc dismissViewControllerAnimated:YES completion:nil];
        });
    }];
    
    [self.view addSubview:tabBarVc.view];
    [self addChildViewController:tabBarVc];
}



@end
