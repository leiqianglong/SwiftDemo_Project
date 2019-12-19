//
//  BageValue.m
//  07-QQ粘性布局
//
//  Created by Gavin on 15/9/17.
//  Copyright © 2015年 Gavin. All rights reserved.
//

#import "BageValue.h"


@interface BageValue()

@property(nonatomic,weak) UIView *smallCircle;

@property(nonatomic,weak) CAShapeLayer *shap;

/** 注释*/
@property (nonatomic, strong) UIBezierPath *path;

@end

@implementation BageValue

-(CAShapeLayer *)shap{
    
    if (_shap == nil) {
        //创建形状图层
        CAShapeLayer *shap = [CAShapeLayer layer];
        //设置形状的填充颜色
        shap.fillColor = [UIColor redColor].CGColor;
        _shap = shap;
        [self.superview.layer insertSublayer:shap atIndex:0];
        
    }
    return _shap;

}





-(void)awakeFromNib{
    [self setUP];
}


-(nonnull instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setUP];
    }
    return self;
}

//初始化
- (void)setUP{
    
    //设置圆角
    self.layer.cornerRadius = self.bounds.size.width * 0.5;
    
    //设置文字大小
//    self.titleLabel.font = [UIFont systemFontOfSize:12];
    
    //设置背景颜色.
    [self setBackgroundColor:[UIColor redColor]];
    
    
    //添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    
    //添加小圆
    UIView *smallCircle = [[UIView alloc] init];
    smallCircle.frame = self.frame;
    smallCircle.layer.cornerRadius = self.layer.cornerRadius;
    smallCircle.backgroundColor  = self.backgroundColor;
    self.smallCircle = smallCircle;
    [self.superview insertSubview:smallCircle belowSubview:self];
    


    
    
}



//计算两个圆之间的距离
- (CGFloat)distanceWithSmallCircle:(UIView *)smallCircle bigCircle:(UIView *)bigCircle{
    
    CGFloat offsetX = bigCircle.center.x - smallCircle.center.x;
    CGFloat offsetY = bigCircle.center.y - smallCircle.center.y;
    
    CGFloat d = sqrtf(offsetX * offsetX + offsetY * offsetY);

    return d;
  
}

//根据两个圆描述一个不规则路径
- (UIBezierPath *)pathWithSmallCircle:(UIView *)smallCircle bigCircle:(UIView *)bigCircle{

    
    CGFloat x1 = smallCircle.center.x;
    CGFloat x2 = bigCircle.center.x;
    
    CGFloat y1 = smallCircle.center.y;
    CGFloat y2 = bigCircle.center.y;
    
    CGFloat d = [self distanceWithSmallCircle:smallCircle bigCircle:bigCircle];

    
    CGFloat  cosθ = (y2 - y1) / d;
    CGFloat  sinθ = (x2 - x1) / d;

    CGFloat r1 = smallCircle.bounds.size.width * 0.5;
    CGFloat r2 = bigCircle.bounds.size.width * 0.5;


    CGPoint pointA = CGPointMake(x1 - r1 * cosθ, y1 + r1 * sinθ);
    CGPoint pointB = CGPointMake(x1 + r1 * cosθ, y1 - r1 * sinθ);
    CGPoint pointC = CGPointMake(x2 + r2 * cosθ, y2 - r2 * sinθ);
    CGPoint pointD = CGPointMake(x2 - r2 * cosθ, y2 + r2 * sinθ);
    CGPoint pointO = CGPointMake(pointA.x + d * 0.5 * sinθ, pointA.y + d * 0.5 * cosθ);
    CGPoint pointP = CGPointMake(pointB.x + d * 0.5 * sinθ, pointB.y + d * 0.5 * cosθ);
    
    
    //描述路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //AB
    [path moveToPoint:pointA];
    [path addLineToPoint:pointB];
    //BC(曲线)
    [path addQuadCurveToPoint:pointC controlPoint:pointP];
    //CD
    [path addLineToPoint:pointD];
    //DA(曲线)
    [path addQuadCurveToPoint:pointA controlPoint:pointO];

    
    return path;


}



//当手指开始拖动的时候调用.
- (void)pan:(UIPanGestureRecognizer *)pan{

    //当前移动的偏移量
    CGPoint tranP = [pan translationInView:self];
    
    //frame,center,tansform
    //transform并没有修改center.它修改的frame.
//    self.transform = CGAffineTransformTranslate(self.transform, tranP.x, tranP.y);
    
    CGPoint center = self.center;
    center.x += tranP.x;
    center.y += tranP.y;
    self.center = center;
    //复位
    [pan setTranslation:CGPointZero inView:self];
    
    CGFloat distance = [self distanceWithSmallCircle:self.smallCircle bigCircle:self];
    
    //取出小圆的半径.
    CGFloat radius = self.bounds.size.width * 0.5;
    radius = radius - distance / (self.bounds.size.width * 0.5);
    //重新设置小圆的宽高
    self.smallCircle.bounds = CGRectMake(0, 0, radius * 2, radius * 2);
    self.smallCircle.layer.cornerRadius = radius;
    
    
    
    if (self.smallCircle.hidden == NO) {
        //返回一个不规则的路径.
        UIBezierPath *path = [self pathWithSmallCircle:self.smallCircle bigCircle:self];
        //把路径转换成图形.
        
        self.shap.path = path.CGPath;
//        self.path = path;
//        [self setNeedsDisplay];
    }

    if (distance > 150) {
        self.smallCircle.hidden = YES;
        [self.shap removeFromSuperlayer];
    }
    
    if (pan.state == UIGestureRecognizerStateEnded) {
        
        if (distance < 150) {
              [self.shap removeFromSuperlayer];
            self.center = self.smallCircle.center;
            self.smallCircle.hidden = NO;
            
        }else{
            //播放一个动画
            UIImageView *imageV = [[UIImageView alloc] initWithFrame:self.bounds];
            
            NSMutableArray *imageArray = [NSMutableArray array];
            
            for (int i = 0; i < 8; i++) {
                NSString *imageName  = [NSString stringWithFormat:@"qq-%d",i+1];
                UIImage *image = [UIImage imageNamed:imageName];
                [imageArray addObject:image];
            }

            imageV.animationImages = imageArray;
            [imageV setAnimationDuration:1];
            [imageV startAnimating];
            [self addSubview:imageV];
            //消失
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self removeFromSuperview];
            });
        }
        
    }
    
    
    
    
    
    
    
    

}



-(void)setHighlighted:(BOOL)highlighted{

}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect {
//    // Drawing code
//    [self.path fill];
//}


@end
