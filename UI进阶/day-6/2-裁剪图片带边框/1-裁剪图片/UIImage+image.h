//
//  UIImage+image.h
//  1-裁剪图片
//
//  Created by gouzi on 2017/5/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)


/**
 返回一张带有边框的圆形图片

 @param width 边框的宽度
 @param borderColor 边框的颜色
 @param clipedimage 需要裁剪的图片
 @return 带有边框的圆形图片
 */
+ (UIImage *)imageWithBorderWidth:(CGFloat)width borderColor:(UIColor *)borderColor image:(UIImage *)clipedimage;




/**
 返回一张由纯色填充的图片

 @param color 填充的颜色
 @return 一张纯色的图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color;


@end
