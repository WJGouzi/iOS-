//
//  UITextField+initial.h
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/15.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (initial)

// 国旗
- (void)initWithText;

// 生日
- (void)initWithBirthday;

// 省市
- (void)initWithProvinceAndCity;

@end
