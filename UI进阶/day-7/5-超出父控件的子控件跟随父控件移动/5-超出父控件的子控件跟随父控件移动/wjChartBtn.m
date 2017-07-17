//
//  wjChartBtn.m
//  5-超出父控件的子控件跟随父控件移动
//
//  Created by gouzi on 2017/5/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjChartBtn.h"

@implementation wjChartBtn


- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSLog(@"self pop btn %@", self.popBtn);
    
    if (self.popBtn) {
        // 判断当前的点在不在popBtn的身上
        // 把当前点转换成popBtn身上的点
        CGPoint popPoint = [self convertPoint:point toView:self.popBtn];
        if ([self.popBtn pointInside:popPoint withEvent:event]) {
            return self.popBtn;
        } else {
            return [super hitTest:point withEvent:event];
        }
    } else {
        return [super hitTest:point withEvent:event];
    }
}



- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint current = [touch locationInView:self];
    CGPoint previous = [touch preciseLocationInView:self];
//    CGPoint offsetPoint = CGPointMake(current.x - previous.x, current.y - previous.y);
    self.transform = CGAffineTransformTranslate(self.transform, current.x - previous.x, current.y - previous.y);
}

@end
