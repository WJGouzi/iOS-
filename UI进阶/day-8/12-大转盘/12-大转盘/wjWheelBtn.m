//
//  wjWheelBtn.m
//  12-大转盘
//
//  Created by gouzi on 2017/7/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjWheelBtn.h"

@implementation wjWheelBtn


// 设置按钮的点击区域
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    // 判断区域
    CGRect rect = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height * 0.5);
    if (CGRectContainsPoint(rect, point)) {
        return [super hitTest:point withEvent:event];
    } else {
        return nil;
    }
    
}


// 返回当前按钮中图片位置的位置以及尺寸
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat W = 40;
    CGFloat H = 48;
    CGFloat X = (contentRect.size.width - W) * 0.5;
    CGFloat Y = 20;
    return CGRectMake(X, Y, W, H);
}


//// 返回按钮中文字的尺寸的设置
//- (CGRect)titleRectForContentRect:(CGRect)contentRect {
//
//}


/**
 取消按钮的高亮状态
 */
- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
