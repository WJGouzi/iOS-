//
//  ViewController.m
//  07-心跳效果
//
//  Created by gouzi on 2017/7/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 创建对象
    CABasicAnimation *animation = [CABasicAnimation animation];
    // 设置属性值
    animation.keyPath = @"transform.scale";
    animation.toValue = @0;
    // 多次执行
    animation.repeatCount = MAXFLOAT;
    // 动画执行的时长
    animation.duration = 0.8;
    
    // 自动翻转-> 怎么去的就怎么回来
    animation.autoreverses = YES;
    
    // 添加动画
    [self.imageView.layer addAnimation:animation forKey:nil];
    
}

@end
