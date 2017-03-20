//
//  wjButton.m
//  5-buttonSubElementsLayout
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjButton.h"

@implementation wjButton


- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        // 改掉按钮的文字的居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

// 方式二：
- (void)layoutSubviews {
    [super layoutSubviews];
    // 设置子控件的位置
    self.titleLabel.frame = CGRectMake(0, 0, 100, 70);
    self.imageView.frame = CGRectMake(100, 0, 70, 70);

}


// 方式一
/*
 重写方法
 */
/*
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0, 0, 100, 70);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake(100, 0, 70, 70);
}
*/

@end
