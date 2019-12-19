
//
//  QRChartView.m
//  chart
//
//  Created by hou on 2018/1/12.
//  Copyright © 2018年 hou. All rights reserved.
//

#import "QRChartView.h"
#import "QRCollectionViewCell.h"
#import "SDAutoLayout.h"
#import "UIColor+get_FFFFFFcolor.h"
#define YLabel_TOP 8 //组件间隙高度
#define YRightMarkHeight 20 //右标注高度

#define YLabel_Height 20 //Y轴label高度

#define YLeft 55
#define YRight 20

#define YCount 8 //Y隔断数量
@interface QRChartView()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    /** Y轴刻度LABEL */
    CGFloat YLabelTop;
    /** tab Width */
    CGFloat widthChart;
    /** tab Height */
    CGFloat heightChart;
    /** value MAX */
    CGFloat maxValue;
}
@property (nonatomic,strong)UICollectionView *collectionView;

@end

@implementation QRChartView


-(instancetype)initWithFrame:(CGRect)frame{
    if ([super initWithFrame:frame]) {
         [self setView];
    }
    return  self;
    
}
- (void)setView{
    [self creatTableView];
}

- (void)creatTableView{

    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    //设置CollectionView的属性
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, 10, self.frame.size.width-10,self.frame.size.width) collectionViewLayout:layout];
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.scrollEnabled = YES;
    [self addSubview:self.collectionView];
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;

    [self.collectionView registerClass:[QRCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];

}


#pragma mark  设置CollectionView的组数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

#pragma mark  设置CollectionView每组所包含的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.valueSource.count;
    
}

#pragma mark  设置CollectionCell的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"cell";
    QRCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identify forIndexPath:indexPath];
   
    CGFloat h = [self.valueSource[indexPath.row] floatValue] * 8;
    
    
    [UIView animateWithDuration:0.3 animations:^{
        cell.chartLabel.sd_layout.heightIs(h);
        cell.titleLabel.text = self.titleSource[indexPath.row];
    }];
    return cell;
}
#pragma mark  定义每个UICollectionView的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return  CGSizeMake(60,self.frame.size.height);
}



#pragma mark  定义整个CollectionViewCell与整个View的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);//（上、左、下、右）
}


#pragma mark  定义每个UICollectionView的横向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

#pragma mark  定义每个UICollectionView的纵向间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (NSMutableArray *)titleSource{
    if (!_titleSource) {
        self.titleSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _titleSource;
}

- (NSMutableArray *)valueSource{
    if (!_valueSource) {
        self.valueSource = [NSMutableArray arrayWithCapacity:1];
    }
    return _valueSource;
}

@end
