//
//  DemoVC9.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/4/20.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "DemoVC9.h"
#import "QTableHeaderView.h"
#import "QContentCell.h"
#import "SDAutoLayout.h"

@interface DemoVC9 ()

@end

@implementation DemoVC9

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initUI];
    [self.tableView registerClass:[QContentCell class] forCellReuseIdentifier:@"cell"];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    QContentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
  
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *str = @"沙发上拉丝粉金坷垃打扫房间奥威放假了抛弃我就 安居打扫房间克拉的私家车发牢骚的九分裤拉的屎附近可拉倒设计费卡电视剧";
//    return [self.tableView cellHeightForIndexPath:indexPath model:str keyPath:@"text" cellClass:[QContentCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
//    
    
    return 150;
}
-(void)initUI{
    self.tableView.tableHeaderView = [[QTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    
}
@end
