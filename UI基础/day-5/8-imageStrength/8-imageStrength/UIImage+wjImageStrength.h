//
//  UIImage+wjImageStrength.h
//  8-imageStrength
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (wjImageStrength)

/**
 *  返回一张被保护的图片（被拉伸）
 */
+ (instancetype)resizableImageWithOriginImageName:(NSString *)OriginImageName;

@end
