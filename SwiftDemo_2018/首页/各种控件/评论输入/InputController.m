//
//  InputController.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/17.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "InputController.h"
#import "ZInputToolbar.h"
#import "UIView+LSExtension.h"
@interface InputController () <ZInputToolbarDelegate>
@property (nonatomic, strong) ZInputToolbar *inputToolbar;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation InputController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.title = @"输入框";
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 100, self.view.width - 20, 100)];
    [self.btn setBackgroundColor:[UIColor redColor]];
    [self.btn setTitle:@"点我" forState:UIControlStateNormal];
    [self.btn addTarget:self action:@selector(didTouchBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.btn];
    
    // 输入框
    [self setTextViewToolbar];
}

-(void)setTextViewToolbar {
    self.inputToolbar = [[ZInputToolbar alloc] initWithFrame:CGRectMake(0,self.view.height-50, self.view.width, 50)];
    self.inputToolbar.textViewMaxLine = 5;
    self.inputToolbar.delegate = self;
    self.inputToolbar.placeholderLabel.text = @"请输入...";
    [self.view addSubview:self.inputToolbar];
}

-(void)didTouchBtn {
    [self.inputToolbar.textInput becomeFirstResponder];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.inputToolbar.textInput resignFirstResponder];
}

#pragma mark - ZInputToolbarDelegate
-(void)inputToolbar:(ZInputToolbar *)inputToolbar sendContent:(NSString *)sendContent {
    [self.btn setTitle:sendContent forState:UIControlStateNormal];
    // 清空输入框文字
    [self.inputToolbar sendSuccessEndEditing];
}

@end
