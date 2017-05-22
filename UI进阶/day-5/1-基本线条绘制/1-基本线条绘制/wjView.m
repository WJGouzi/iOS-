//
//  wjView.m
//  1-基本线条绘制
//
//  Created by gouzi on 2017/5/22.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjView.h"

@implementation wjView


// 自动生成的方法，他是自动把图形上下文和本格view进行绑定

/**
 * 作用:专门用来绘图
 * 系统自动调用
 * 当view显示的时候进行调用
 @param rect 这是图行绘制的区域大小(bounds)。
 */
- (void)drawRect:(CGRect)rect {
    [self drawQuadCurve];
    [self drawLine];
}

- (void)drawQuadCurve {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 200)];
    [path addQuadCurveToPoint:CGPointMake(200, 50) controlPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(50, 200)]; //
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}



- (void)drawLine {
    // 1.上下文 (获取或者创建都是以UIGraphics开头)
    CGContextRef ref = UIGraphicsGetCurrentContext();
    // 2.绘制路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    // 2.1设置起点
    [path moveToPoint:CGPointMake(50, 280)];
    // 2.2添加一根线到终点
    [path addLineToPoint:CGPointMake(280, 50)];
    
    // 另外一条线
    [path moveToPoint:CGPointMake(100, 150)];
    [path addLineToPoint:CGPointMake(259, 30)];
    // 上一条线的终点作为另一条的起点
    [path addLineToPoint:CGPointMake(30, 60)];
    
    // 设置上下问的状态
    // 设置线宽
    CGContextSetLineWidth(ref, 10.0f);
    // 设置连接的处的状态
    CGContextSetLineJoin(ref, kCGLineJoinRound);
    // 设置线的顶角的样式
    CGContextSetLineCap(ref, kCGLineCapRound);
    // 设置线的颜色
    [[UIColor redColor] setStroke]; // 自动渲染成stroke类似的效果，与下面的渲染模式是相关的
    [[UIColor lightGrayColor] set]; // 自动识别去渲染的效果。
    
    
    
    // 3.把绘制的内容保存到上下文中
    CGContextAddPath(ref, path.CGPath);
    // 4.把上下文内容显示渲染到view的layer上去(stroke/fill)
    CGContextStrokePath(ref);

}


@end
