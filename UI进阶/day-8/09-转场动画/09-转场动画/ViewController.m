//
//  ViewController.m
//  09-转场动画
//
//  Created by gouzi on 2017/7/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UIView做转场
    [UIView transitionWithView:self.imageView duration:0.5 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        i++;
        if (i == 4) {
            i = 1;
        }
        
        NSString *imageName = [NSString stringWithFormat:@"%d", i];
        self.imageView.image = [UIImage imageNamed:imageName];
    } completion:^(BOOL finished) {
        
    }];
    
}

static int i = 1;
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 转场动画和转场代码必须在同一个方法中
    
    i++;
    if (i == 4) {
        i = 1;
    }
    
    NSString *imageName = [NSString stringWithFormat:@"%d", i];
    self.imageView.image = [UIImage imageNamed:imageName];

    // 添加转场动画
    CATransition *animation = [CATransition animation];
    animation.duration = 1;
//    animation.type = @"cube"; // 立体翻转的动画
    animation.type = @"rippleEffect"; // 水滴动画
    
    // 设置动画的起止位置
    animation.startProgress = 0.2;
    animation.endProgress = 0.8;
    
    
    // 添加转场动画
    [self.imageView.layer addAnimation:animation forKey:nil];
}



@end
