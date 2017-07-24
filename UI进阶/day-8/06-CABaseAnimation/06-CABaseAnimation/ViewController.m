//
//  ViewController.m
//  06-CABaseAnimation
//
//  Created by gouzi on 2017/7/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *wjView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.创建动画对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    // 2.设置属性值
    animation.keyPath = @"position.x";
    animation.toValue = @300;
    // 动画完成时不要移除动画
    animation.removedOnCompletion = NO;
    /* The legal values->动画完成后的状态
    * are `backwards', `forwards', `both' and `removed'. Defaults to
    * `removed'. */
    animation.fillMode = kCAFillModeForwards;
    // 3.添加动画
    [self.wjView.layer addAnimation:animation forKey:nil]; // 动画完成时会自动删除动画
    
}



@end
