//
//  QRTableViewCtr.m
//  SwiftDemo_2018
//
//  Created by hou on 2018/1/20.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "QRTableViewCtr.h"
#import "LXPlayVerticalController.h"
#import "LXPushNotSupportRotateController.h"
#import "LXPresentSupportController.h"
#import "LXPresentNotSupportController.h"

@interface QRTableViewCtr ()
@property(nonatomic,strong)NSArray *dataA;
@end

@implementation QRTableViewCtr

- (void)viewDidLoad {
    [super viewDidLoad];

}



#pragma mark - Table view data source
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row ==0) {
        LXPlayVerticalController *changeVc =[[LXPlayVerticalController alloc]init];
        [self.navigationController pushViewController:changeVc animated:YES];
    }
    
    if (indexPath.row ==1) {
        LXPushNotSupportRotateController *changeVc =[[LXPushNotSupportRotateController alloc]init];
        [self.navigationController pushViewController:changeVc animated:YES];
    }
    
    if (indexPath.row ==2) {
        LXPresentSupportController *changeVc =[[LXPresentSupportController alloc]init];
        [self.navigationController presentViewController:changeVc animated:YES completion:nil];
    }
    if (indexPath.row ==3) {
        LXPresentNotSupportController *changeVc =[[LXPresentNotSupportController alloc]init];
        [self.navigationController presentViewController:changeVc animated:YES completion:nil];
        
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     return self.dataA.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = self.dataA[indexPath.row];
    return cell;
}
-(NSArray *)dataA{
    if (!_dataA) {
        _dataA =@[@"push支持多个方向",@"push不支持多个方向",@"present支持多个方向",@"presentbu不支持多个方向"];
    }
    return _dataA;
}


@end
