//
//  wjHitTestView.m
//  4-hittTestPractice
//
//  Created by gouzi on 2017/5/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjHitTestView.h"

@interface wjHitTestView ()

// 从xib拖入不了，就从代码往xib中拖
@property (nonatomic, weak) IBOutlet UIButton *btn;

@end

@implementation wjHitTestView


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    // 拿到后面的按钮
    // 当点在按钮上的时候才返回按钮，不在按钮上的时候就保持系统默认的
    // 转换坐标点
    CGPoint btnPoint = [self convertPoint:point toView:self.btn];
    if ([self.btn pointInside:btnPoint withEvent:event]) {
        return self.btn;
    } else {
        return self;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
}




@end
