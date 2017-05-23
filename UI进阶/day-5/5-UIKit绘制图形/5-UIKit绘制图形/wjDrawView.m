//
//  wjDrawView.m
//  5-UIKit绘制图形
//
//  Created by gouzi on 2017/5/23.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjDrawView.h"

@implementation wjDrawView

- (void)drawRect:(CGRect)rect {
//    [self drawAttributeTextWithRect:rect];
    
//    [self drawAttributeImageWithRcet:rect];

    [self drawClockIndicatorNmuberWithRect:rect];
}



- (void)drawClockIndicatorNmuberWithRect:(CGRect)rect {
    CGPoint center = CGPointMake(rect.size.width * 0.5, rect.size.height * 0.5);
    CGFloat radius = rect.size.width * 0.5 - 20;
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(center.x - radius, center.y - radius, radius * 2, radius * 2)];
    
    [[UIColor lightGrayColor] set];
    [path stroke];
    
    // 绘制文字
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attrDict = @{
                               NSFontAttributeName : [UIFont systemFontOfSize:17.0f],
                               // 设置文字颜色
                               NSForegroundColorAttributeName : [UIColor redColor],
                               NSParagraphStyleAttributeName : paragraphStyle
                               };
    for (int i = 1; i <= 12; ++i) {
        path = [UIBezierPath bezierPath];
        CGFloat angle = -M_PI_2 + i / 12.0f * M_PI * 2;
        // 点
        CGFloat x = center.x + (radius - 50) * cos(angle);
        CGFloat y = center.y + (radius - 50) * sin(angle);
        NSString *clockIndicatorStr = [NSString stringWithFormat:@"%d", i];
        [clockIndicatorStr drawAtPoint:CGPointMake(x, y) withAttributes:attrDict];
        
        
        
        
        
        
        [path moveToPoint:CGPointMake(x, y)];
        [path addLineToPoint:center];
        [path stroke];
    }
}






- (void)drawAttributeImageWithRcet:(CGRect)rect {
    
    // 加载图片
//    UIImage *image =  [UIImage imageNamed:@"小黄人"];
    UIImage *image =  [UIImage imageNamed:@"阿狸头像"];
    
    // 绘制的是原始图片大小
//    [image drawAtPoint:CGPointZero];
    
    // 把要绘制的图片给填充到给定的整个区域中
//    [image drawInRect:rect];
    
    // 平铺，把没有占完的再次接着进行平铺
//    [image drawAsPatternInRect:rect];
    
    
    // 绘制之前进行裁剪->超过区域的地方都被裁掉了，一定要在绘制之前进行裁剪
    UIRectClip(CGRectMake(0, 0, 50, 50));
    [image drawAsPatternInRect:self.bounds];
}






- (void)drawAttributeTextWithRect:(CGRect)rect {
    NSString *wjStr = @"请输入账号名";
    // 阴影的设置
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor blueColor];
    shadow.shadowOffset = CGSizeMake(1, 1);
    shadow.shadowBlurRadius = 3.0f;
    NSDictionary *attrDict = @{
                               NSFontAttributeName : [UIFont systemFontOfSize:40.0f],
                               // 设置文字颜色
                               NSForegroundColorAttributeName : [UIColor redColor],
                               // 设置描边颜色
                               NSStrokeColorAttributeName : [UIColor greenColor],
                               NSStrokeWidthAttributeName : @2,
                               NSShadowAttributeName : shadow
                               };
    // 不会自动换行
    [wjStr drawAtPoint:CGPointZero withAttributes:attrDict];
    // 会自动换行
    //    [wjStr drawInRect:rect withAttributes:attrDict];

}


@end
