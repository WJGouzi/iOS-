//
//  wjDragView.m
//  2-UIView的拖拽
//
//  Created by gouzi on 2017/5/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjDragView.h"

@interface wjDragView ()

@property (nonatomic, assign) CGPoint currentPoint;

@end


@implementation wjDragView


- (void)drawRect:(CGRect)rect {

    
}


// 获取当前偏移的点
- (CGPoint)wjGetCurrentOffsetPoint:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    CGPoint current =  [touch locationInView:self];
    CGPoint previous = [touch previousLocationInView:self];
    return CGPointMake(current.x - previous.x, current.y - previous.y);
}

- (CGPoint)wjGetCurrentPoint:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    return  [touch locationInView:self];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 开始点击的时候就保存到当前view的所在的点
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint offsetPoint = [self wjGetCurrentOffsetPoint:touches];
    self.transform = CGAffineTransformTranslate(self.transform, offsetPoint.x, offsetPoint.y);
}


- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGFloat screenW = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenH = [UIScreen mainScreen].bounds.size.height;
    CGFloat btnH = self.frame.size.height;
    CGFloat btnW = self.frame.size.width;
    CGFloat btnX = self.frame.origin.x;
    CGFloat btnY = self.frame.origin.y;
    // 现在的点的origin,和屏幕边距的大小
    // 最右边
    CGFloat btnToRight = screenW - btnW - btnX;
    CGFloat btnToLeft = btnX;
    self.currentPoint = [self wjGetCurrentPoint:touches];
    if (self.frame.origin.x > screenW * 0.5) {
        // 往右边移动
        CGFloat offsetX = btnToRight - 10;
        [UIView animateWithDuration:0.5 animations:^{
            self.transform = CGAffineTransformTranslate(self.transform, offsetX, 0);
        }];
    } else {
        CGFloat offsetX = btnToLeft - 10;
        [UIView animateWithDuration:0.5 animations:^{
            self.transform = CGAffineTransformTranslate(self.transform, -offsetX, 0);
        }];
    }
    if (btnY + btnH > screenH) {
        [UIView animateWithDuration:0.5 animations:^{
            CGFloat offsetY = 10 + btnY + btnH - screenH;
            self.transform = CGAffineTransformTranslate(self.transform, 0, -offsetY);
        }];
    } else if (btnY < 0) {
        CGFloat offsetY = 20 - btnY;
        [UIView animateWithDuration:0.5 animations:^{
            self.transform = CGAffineTransformTranslate(self.transform, 0, offsetY);
        }];
    }
    
}

@end
