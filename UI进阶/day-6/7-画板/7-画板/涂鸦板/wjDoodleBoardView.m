//
//  wjDoodleBoardView.m
//  7-画板
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjDoodleBoardView.h"
#import "wjBezierPath.h"

@interface wjDoodleBoardView ()

@property (nonatomic, strong) UIBezierPath *path;

/** 路径的数组  */
@property (nonatomic, strong) NSMutableArray *allPathArray;

/* 当前路径的线宽*/
@property (nonatomic, assign) CGFloat width;

/** 默认颜色 */
@property (nonatomic, strong) UIColor *color;

@end

@implementation wjDoodleBoardView


- (NSMutableArray *)allPathArray {
    if (!_allPathArray) {
        _allPathArray = [NSMutableArray array] ;
    }
    return _allPathArray;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGesture:)];
    [self addGestureRecognizer:pan];
    self.width = 1.0f;
    self.color = [UIColor blackColor];
}


- (void)panGesture:(UIPanGestureRecognizer *)pan {
    
    // 获取当前的点
    CGPoint currentPoint = [pan locationInView:self];
    // 判断手势状态
    if (pan.state == UIGestureRecognizerStateBegan) {
        // 创建路径
        wjBezierPath *path = [[wjBezierPath alloc] init];// 由于没有颜色这个属性，所以就自定义属性
        // 设置线宽
        [path setLineWidth:self.width];
        // 设置线的颜色
        path.color = self.color;
        [self.allPathArray addObject:path];
        self.path = path;
        // 设置起点
        [path moveToPoint:currentPoint];
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        // 绘制一根线，到当前手指所在的点
        [self.path addLineToPoint:currentPoint];
        [self setNeedsDisplay];
    }
}

#pragma mark - 各种操作设置
/** 清屏*/
- (void)wjClearScreen {
    [self.allPathArray removeAllObjects];
    [self setNeedsDisplay];
}

/** 撤销 */
- (void)wjUndo {
    [self.allPathArray removeLastObject];
    [self setNeedsDisplay];
}

/** 擦除*/
static BOOL isCliked = YES;
- (void)wjErase {
    if (isCliked) {
        [self wjSetLineColor:[UIColor whiteColor]];
    } else {
        [self wjSetLineColor:[UIColor blackColor]];
    }
    isCliked = !isCliked;
}

/** 线宽*/
- (void)wjSetLineWidth:(CGFloat)width {
    // 设置线宽应先于保存路径之前。
    self.width = width;
}

/** 线的颜色*/
- (void)wjSetLineColor:(UIColor *)color {
    // 和设置线宽的思路是一致的
    self.color = color;
}


- (void)drawRect:(CGRect)rect {
    // 绘制保存的所有路径
    for (wjBezierPath *path in self.allPathArray) {
        [path.color set];
        [path stroke];
    }
    
}







@end
