//
//  DemoVC3.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/19.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "DemoVC3.h"
#import "TestCell2.h"
#import "SDAutoLayout.h"

@interface DemoVC3 ()

@end

@implementation DemoVC3
{
    NSArray *_textArray;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _rowCount = (long)10;
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"
                           ];
    
     _textArray = textArray;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _rowCount;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    int index = indexPath.row % 5;
    static NSString *ID = @"test";
    TestCell2 *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[TestCell2 alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.text = _textArray[index];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = indexPath.row % 5;
    NSString *str = _textArray[index];
    return [self.tableView cellHeightForIndexPath:indexPath model:str keyPath:@"text" cellClass:[TestCell2 class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
}

@end
