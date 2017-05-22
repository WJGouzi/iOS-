//
//  wjProgressView.m
//  3-下载进度显示
//
//  Created by gouzi on 2017/5/22.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjProgressView.h"

@implementation wjProgressView


- (void)setProgressValue:(CGFloat)progressValue {
    _progressValue = progressValue;
    // 注意：如果是手动调用，他是不会创建跟View相关联的上下文，只有系统调用该方法时，才会创建和这个view相关联的上下文
//    [self drawRect:self.bounds];
    // 系统自动重绘制
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    
    [self drawArcWithRect:rect];
}


- (void)drawArcWithRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    CGFloat startAngle = -M_PI_2;
    CGFloat progressAngle = self.progressValue * M_PI * 2;
    CGFloat endAngle = startAngle + progressAngle;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:YES];
    [path setLineWidth:3.0f];
    CGContextAddPath(ctx, path.CGPath);
    CGContextStrokePath(ctx);
}


@end
