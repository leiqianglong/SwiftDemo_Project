//
//  FloatBtnCtr.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/5.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "FloatBtnCtr.h"
#import "ZMFloatButton.h"
#import "FloatButtonsCtr.h"

@interface FloatBtnCtr ()<ZMFloatButtonDelegate>
@property(nonatomic,strong)ZMFloatButton *floatBtn;


@end

@implementation FloatBtnCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"下一页" style:(UIBarButtonItemStyleDone) target:self action:@selector(next)];
   
    self.floatBtn = [[ZMFloatButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-46, SCREEN_HEIGHT*0.2, 46, 46)];
    self.floatBtn.delegate = self;
    //    self.floatBtn.isMoving = NO;
    self.floatBtn.bannerIV.image = [UIImage imageNamed:@"publishAdd"];
    [self.view addSubview:self.floatBtn];
    [self.view bringSubviewToFront:self.floatBtn];
    

}

-(void)next{
    FloatButtonsCtr *vc = [[FloatButtonsCtr alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -ZMFloatButtonDelegate
- (void)floatTapAction:(ZMFloatButton *)sender{
    NSLog(@"ZMFloatButtonDelegate");
}
@end
