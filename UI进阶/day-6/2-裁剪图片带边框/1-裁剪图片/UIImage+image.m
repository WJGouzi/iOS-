//
//  UIImage+image.m
//  1-裁剪图片
//
//  Created by gouzi on 2017/5/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "UIImage+image.h"

@implementation UIImage (image)


+ (UIImage *)imageWithBorderWidth:(CGFloat)width borderColor:(UIColor *)borderColor image:(UIImage *)clipedimage {
    UIImage *image = clipedimage;
    // 1确定边框宽度
    CGFloat borderW = width;
    // 2开启一个上下文
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 3绘制大圆显示出来
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [borderColor set];
    [path fill];
    // 4绘制小圆->把小圆设置成裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [clipPath addClip];
    // 5把图片绘制上下文中
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    // 6把上下文中的图片取出来
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 7关闭上下文
    UIGraphicsEndImageContext();
    return newImg;
}


+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1.0f, 1.0f);
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 开启上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 将颜色填充到上下文中
    CGContextSetFillColorWithColor(ctx, color.CGColor);
    // 渲染到上下文中
    CGContextFillRect(ctx, rect);
    // 从位图上下文中获取图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    return image;
}






@end
