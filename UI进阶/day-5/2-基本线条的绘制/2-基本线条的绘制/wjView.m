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
    [self drawArcWithRect:rect];
//    [self drawCircleWithNoContext];
//    [self drawCircle];
//    [self drawRect];
}

- (void)drawArcWithRect:(CGRect)rect {
    // 中心点如果设置的是self.center 坐标系会相对与父控件来说的
    // 话弧
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:150.f startAngle:0 endAngle:M_PI_4 clockwise:YES];
    // 画扇形
    [path addLineToPoint:center];
    [path closePath];

    [[UIColor redColor] set];
    [path fill]; // 填充之前，自动的关闭路径。
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
