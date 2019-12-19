//
//  Layout_Demo1.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/17.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "Layout_Demo1.h"
#import "DemoModel.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "MyTableViewCell.h"

@interface Layout_Demo1 ()
@property (nonatomic, strong) NSMutableArray *modelsArray;
@end

@implementation Layout_Demo1

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatModelsWithCount:20];
    [self.tableView registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyTableViewCell"];
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell"];
    
    cell.model = self.modelsArray[indexPath.row];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    DemoModel *model = self.modelsArray[indexPath.row];
    return [self.tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[MyTableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
    
}

//模拟数据
- (void)creatModelsWithCount:(NSInteger)count
{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray new];
    }
    
    NSArray *iconImageNamesArray = @[@"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg",
                                     @"icon4.jpg",
                                     @"icon0.jpg",
                                     @"icon1.jpg",
                                     @"icon2.jpg",
                                     @"icon3.jpg"
                                     ];
    
    
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的LaunchImage 时。然后等比例拉伸屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"然后等比例拉伸到大屏。屏幕宽度返回 320否则在大屏上会显得字大长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会",
                           @"长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。"
                           ];
    
    for (int i = 0; i < count; i++) {
        
        int nameRandomIndex = arc4random_uniform(5);
        
        DemoModel *model = [DemoModel new];
        model.title = textArray[nameRandomIndex];
        model.iconImagePath = iconImageNamesArray[arc4random_uniform(9)];
        
        // 模拟“有或者无图片”
        int random = arc4random_uniform(1);
        if (random <= 8) {
            NSMutableArray *temp = [NSMutableArray new];
            
            int randomImagesCount = arc4random_uniform(9);
            for (int i = 0; i < randomImagesCount; i++) {
                int randomIndex = arc4random_uniform(9);
                NSString *text = iconImageNamesArray[randomIndex];
                [temp addObject:text];
            }
            
            model.imagePathsArray = [temp copy];
        }
        
        [self.modelsArray addObject:model];
    }
}
@end
