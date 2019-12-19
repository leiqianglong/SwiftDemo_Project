//
//  FloatButtonsCtr.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/17.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "FloatButtonsCtr.h"
#import "CCZSpreadButton.h"

@interface FloatButtonsCtr ()<CCZSpreadButtonDelegate>
@property (nonatomic, strong) CCZSpreadButton *com;
@end

@implementation FloatButtonsCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"按钮";
    CCZSpreadButton *com  = [[CCZSpreadButton alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    com.itemsNum = 7;
    [self.view addSubview:com];
    self.com = com;
    com.normalImage = [UIImage imageNamed:@"plus_L"];
    com.selImage = [UIImage imageNamed:@"plus_F"];
    com.images = @[@"lock_F",@"lock_F",@"lock_F",@"lock_F",@"lock_F",@"lock_F",@"lock_F"];
    [com spreadButtonDidClickItemAtIndex:^(NSUInteger index) {
        NSLog(@"%ld",index);
    }];
}

- (IBAction)openVisouse:(UISwitch *)sender {
    self.com.spreadButtonOpenViscousity = sender.on;
}
- (IBAction)openClickTemp:(UISwitch *)sender {
    self.com.canClickTempOn = sender.on;
}
- (IBAction)openAutoFit:(UISwitch *)sender {
    self.com.autoAdjustToFitSubItemsPosition = sender.on;
}
- (IBAction)changeSlider:(UISlider *)sender {
    self.com.spreadDis = sender.value;
}
- (IBAction)didChange:(UISegmentedControl *)sender {
    self.com.style = sender.selectedSegmentIndex;
}

@end
