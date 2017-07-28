//
//  wjWheelView.h
//  12-大转盘
//
//  Created by gouzi on 2017/7/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wjWheelView : UIView

/**
 快速创建的方法
 */
+ (instancetype)wheelView;

/**
 开始旋转
 */
- (void)rotate;


/**
 停止旋转
 */
- (void)stop;

@end
