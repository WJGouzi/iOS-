//
//  wjDoodleBoardView.m
//  7-画板
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjDoodleBoardView.h"

@interface wjDoodleBoardView ()

@property (nonatomic, strong) UIBezierPath *path;

/** 路径的数组  */
@property (nonatomic, strong) NSMutableArray *allPathArray;

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
}


- (void)panGesture:(UIPanGestureRecognizer *)pan {
    
    // 获取当前的点
    CGPoint currentPoint = [pan locationInView:self];
    // 判断手势状态
    if (pan.state == UIGestureRecognizerStateBegan) {
        // 创建路径
        UIBezierPath *path = [UIBezierPath bezierPath];
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



- (void)drawRect:(CGRect)rect {
    // 绘制保存的所有路径
    for (UIBezierPath *path in self.allPathArray) {
        [path stroke];
    }
    
}







@end
