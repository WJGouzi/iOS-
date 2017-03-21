//
//  UIImage+wjImageStrength.m
//  8-imageStrength
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "UIImage+wjImageStrength.h"

@implementation UIImage (wjImageStrength)

+ (instancetype)resizableImageWithOriginImageName:(NSString *)OriginImageName {
    
    // 创建图片对象
    UIImage *image = [UIImage imageNamed:OriginImageName];
    // 获取图片的宽高
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    
    return [image stretchableImageWithLeftCapWidth:imageWidth * 0.5 topCapHeight:imageHeight * 0.5];
}


@end
