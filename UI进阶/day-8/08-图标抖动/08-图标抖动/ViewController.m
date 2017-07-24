//
//  ViewController.m
//  08-图标抖动
//
//  Created by gouzi on 2017/7/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

#define angleToRad(angle) ((angle) / 180.0f * M_PI)

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self method1];
//    [self method2];
    [self method3];
}


/**
 指定路径进行动画
 */
- (void)method3 {
    // 1.创建
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(50, 50)];
    [path addLineToPoint:CGPointMake(300, 300)];
    animation.keyPath = @"position";
    animation.path = path.CGPath;
    animation.duration = 1.0f;
    [self.imageView.layer addAnimation:animation forKey:nil];
    
}



/**
 指定的值进行动画
 */
- (void)method2 {
    // 1.创建动画对象
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    // 2.设置属性值
    animation.keyPath = @"transform.rotation";
    animation.values = @[@(angleToRad(-5)), @(angleToRad(5)), @(angleToRad(-5))];
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.5f;
    [self.imageView.layer addAnimation:animation forKey:nil];
}


/**
 指定的值进行动画
 */
- (void)method1 {
    // 1.创建动画对象
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    // 2.设置属性值
    animation.keyPath = @"transform.rotation";
    animation.values = @[@(angleToRad(-5)), @(angleToRad(5))];
    animation.repeatCount = MAXFLOAT;
    animation.duration = 0.5f;
    animation.autoreverses = YES;
    [self.imageView.layer addAnimation:animation forKey:nil];
}


@end
