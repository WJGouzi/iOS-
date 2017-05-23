//
//  wjSnowView.m
//  7-雪花效果
//
//  Created by gouzi on 2017/5/23.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjSnowView.h"

@interface wjSnowView ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation wjSnowView



- (void)awakeFromNib {
    [super awakeFromNib];
    // 第一种方案
    // 刷洗不是那么的顺畅
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(wjChangeSnow) userInfo:nil repeats:YES];
//    [self.timer fire];
    
    // 第二种方案
    // 当每次屏幕刷新的时候，就会调用指定的方法 （屏幕每一秒刷新60次）
    // 刷新的时候会比较顺滑的刷新
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(wjChangeSnow)];
//    link.duration = 0.2;
    // 让CADisplayLink工作，需要添加到runloop中
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    // setNeedsDisplay会调用drawRect:方法，但他不是马上去调用修改，而是设立一个flag，当屏幕进行刷新的时候这才会去调用drawRect:方法
    
}

- (void)dealloc {
//    [self.timer invalidate];
}

static int _snowY = 0;
- (void)wjChangeSnow {
    _snowY += 10;
    if (_snowY > CGRectGetHeight([UIScreen mainScreen].bounds)) {
        _snowY = 0;
    }
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {

    UIImage *image = [UIImage imageNamed:@"雪花"];
    
    [image drawAtPoint:CGPointMake(0, _snowY)];
    
}


@end
