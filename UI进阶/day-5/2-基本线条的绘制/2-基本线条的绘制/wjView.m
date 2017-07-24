//
//  wjView.m
//  2-基本线条的绘制
//
//  Created by gouzi on 2017/5/22.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjView.h"

@implementation wjView


- (void)drawRect:(CGRect)rect {
//    [self drawArcWithRect:rect];
//    [self drawCircleWithNoContext];
//    [self drawCircle];
//    [self drawRect];
    
    
    [self drawTestWithRect:rect];
}

- (void)wjDrawCurveLine {
    
}



- (void)drawTestWithRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    // 画刻度
    UIBezierPath *clock = [UIBezierPath bezierPath];
    for (int i = 0; i < 60; ++i) {
        CGFloat angle = -M_PI_2 + i / 60.0 * M_PI * 2;
        NSLog(@"%f", angle);
        // 圆上的点
        CGFloat x = center.x + radius * cos(angle);
        CGFloat y = center.y + radius * sin(angle);
        [clock moveToPoint:CGPointMake(x, y)];
        // 刻度线的另一端
        CGFloat x0 = center.x + (radius - 10) * cos(angle);
        CGFloat y0 = center.y + (radius - 10) * sin(angle);
        
        // 5的倍数的长度
        if (i % 5 == 0) {
            CGFloat x1 = center.x + (radius - 20) * cos(angle);
            CGFloat y1 = center.y + (radius - 20) * sin(angle);
            [clock addLineToPoint:CGPointMake(x1, y1)];
        }
        
        [clock addLineToPoint:CGPointMake(x0, y0)];
        [[UIColor purpleColor] set];
    }
    CGContextAddPath(ctx, clock.CGPath);
    CGContextStrokePath(ctx);
}



- (void)drawArcWithRect:(CGRect)rect {
    // 中心点如果设置的是self.center 坐标系会相对与父控件来说的
    // 话弧
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:30 startAngle:0 endAngle:M_PI_4 clockwise:YES];
    // 画扇形
    [path addLineToPoint:center];
//    [path closePath];
    
    [[UIColor redColor] set];
    [path stroke]; // 填充之前，自动的关闭路径。
}


- (void)drawCircleWithNoContext {
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 250, 100, 50)];
    [[UIColor grayColor] set];
    
    // 利用 UIBezierPath 提供的方法进行绘图方式进行设置
    [path stroke];
}


- (void)drawCircle {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 椭圆
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 150, 100, 50)];
    [[UIColor blueColor] set];
    CGContextAddPath(ctx, path.CGPath);
    CGContextFillPath(ctx);
}


- (void)drawRect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(50, 50, 100, 100)];
    // 设置圆角的矩形 -> 当圆角半径为边长的一半的时候就变成圆形了、
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(50, 50, 100, 100) cornerRadius:10.f];
    
    [[UIColor redColor] set];
    CGContextAddPath(ctx, path.CGPath);
    //    CGContextStrokePath(ctx);
    CGContextFillPath(ctx);
}



@end
