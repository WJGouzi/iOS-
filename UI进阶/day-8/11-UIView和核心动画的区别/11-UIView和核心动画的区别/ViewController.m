//
//  ViewController.m
//  11-UIView和核心动画的区别
//
//  Created by gouzi on 2017/7/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <CAAnimationDelegate>
@property (weak, nonatomic) IBOutlet UIView *wjView;

@end

@implementation ViewController


/*
 * UIView和核心动画的区别
 *  1.核心动画只作用于layer上
 *  2.核心动画并没有修改wjView的frame真实值
 *
 * 使用核心动画和UIView动画
 *  1.当不需要与用户交互的时候使用核心动画
 *  2.当使用路径做动画，需要使用核心动画
 *  3.做转场动画，使用核心动画->转场的类型比较多
 */




- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"view frame %@", NSStringFromCGRect(self.wjView.frame));
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.toValue = @300;
    animation.duration = 1.0f;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.delegate = self;
    [self.wjView.layer addAnimation:animation forKey:nil];
}


#pragma mark - CAAnimationDelegate

/**
 动画开始时执行

 @param anim 动画
 */
- (void)animationDidStart:(CAAnimation *)anim {

}



/**
 动画完成时执行

 @param anim 动画
 */
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    NSLog(@"%s--%@", __func__, NSStringFromCGRect(self.wjView.frame));
}



@end
