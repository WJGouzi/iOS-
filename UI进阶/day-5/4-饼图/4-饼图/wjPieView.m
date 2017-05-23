//
//  wjPieView.m
//  4-饼图
//
//  Created by gouzi on 2017/5/23.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjPieView.h"

@implementation wjPieView


- (void)drawRect:(CGRect)rect {
    
//    [self drawSectorWithRect:rect];
    [self drawArcWithRect:rect];
}


- (UIColor *)randomColor {
    CGFloat red = arc4random_uniform(256) / 255.0f;
    CGFloat green = arc4random_uniform(256) / 255.0f;
    CGFloat blue = arc4random_uniform(256) / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:1.0f];
}


// 方法二：
- (void)drawArcWithRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    // 扇形1
    CGFloat startAngle = 0;
    CGFloat angle = 0;
    CGFloat endAnngle = 0;
    NSArray *dataArray = @[@25, @25, @50];
    for (NSNumber *number in dataArray) {
        startAngle = endAnngle;
        angle = number.intValue / 100.f * M_PI * 2;
        endAnngle = startAngle + angle;
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAnngle clockwise:YES];
        [path addLineToPoint:center];
        [[self randomColor] set];
        [path fill];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self setNeedsDisplay];
}


// 方法一：
// 画扇形
- (void)drawSectorWithRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 10;
    // 扇形1
    CGFloat startAngle1 = 0;
    CGFloat angle1 = 25 / 100.0f * M_PI * 2;
    CGFloat endAnngle1 = startAngle1 + angle1;
    UIBezierPath *arc1 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle1 endAngle:endAnngle1 clockwise:YES];
    //
    [arc1 addLineToPoint:center];
    [[UIColor redColor] set];
    [arc1 fill];
    
    // 扇形2
    // 方式一：重新开辟内存空间
    CGFloat startAngle2 = endAnngle1;
    CGFloat angle2 = 25 / 100.0f * M_PI * 2;
    CGFloat endAnngle2 = startAngle2 + angle2;
    UIBezierPath *arc2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle2 endAngle:endAnngle2 clockwise:YES];
    [arc2 addLineToPoint:center];
    [[UIColor purpleColor] set];
    [arc2 fill];
    
    // 扇形3
    // 方式二：接着使用上面的path，因为上面的路径已经绘制完成，只要把指针指向移动下就可以了。节约内存
    startAngle2 = endAnngle2;
    angle2 = 50 / 100.f * M_PI * 2;
    endAnngle2 = startAngle2 + angle2;
    arc2 = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle2 endAngle:endAnngle2 clockwise:YES];
    [arc2 addLineToPoint:center];
    [[UIColor greenColor] set];
    [arc2 fill];
    
}




@end
