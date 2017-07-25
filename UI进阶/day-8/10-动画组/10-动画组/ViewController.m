//
//  ViewController.m
//  10-动画组
//
//  Created by gouzi on 2017/7/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIView *wjView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.y";
    animation.toValue = @400;
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
//    [self.wjView.layer addAnimation:animation forKey:nil];
    
    CABasicAnimation *ani = [CABasicAnimation animation];
    ani.keyPath = @"transform.scale";
    ani.toValue = @0.5;
//    animation.removedOnCompletion = NO;
//    animation.fillMode = kCAFillModeForwards;
//    [self.wjView.layer addAnimation:ani forKey:nil];
    
    // 自动执行所有的动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[animation, ani];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    [self.wjView.layer addAnimation:group forKey:nil];
    
    
}

@end
