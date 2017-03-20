//
//  ViewController.m
//  4-wjAnimationUse
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



- (IBAction)translate:(UIButton *)sender {
    // 渐变动画
    // 方式一:
    /*
    // 开始动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5f];
    
    // 动画的代码
    CGRect frame = self.animationView.frame;
    frame.origin.x += 20;
    self.animationView.frame = frame;
    
    // 执行动画
    [UIView commitAnimations];
    */
    
    // 方式二:
    /*
    [UIView animateWithDuration:1.0f animations:^{
        // 动画的代码
        CGRect frame = self.animationView.frame;
        frame.origin.x += 20;
        self.animationView.frame = frame;
    }];
    */
    
    /*
    [UIView animateWithDuration:1.0f animations:^{
        // 动画的代码
        CGRect frame = self.animationView.frame;
        frame.origin.x += 20;
        self.animationView.frame = frame;
    } completion:^(BOOL finished) {
        if (self.animationView.frame.origin.x > self.view.frame.size.width) {
            CGRect frame = self.animationView.frame;
            frame.origin.x = 0;
            self.animationView.frame = frame;
        }
    }];
     */
    
    /*
     UIViewAnimationOptionCurveEaseInOut // 浅入浅出
     UIViewAnimationOptionCurveEaseIn
     UIViewAnimationOptionCurveEaseOut
     UIViewAnimationOptionCurveLinear
     */
    /**/
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        // 动画的代码
        CGRect frame = self.animationView.frame;
        frame.origin.x += 20;
        self.animationView.frame = frame;
    } completion:^(BOOL finished) {
        // 动画的代码
        if (self.animationView.center.x > self.view.frame.size.width) {
            
            CGRect frame = self.animationView.frame;
            frame.origin.x = 0;
            self.animationView.frame = frame;
        }
    }];
}

- (IBAction)zoomScale:(UIButton *)sender {
    [UIView animateWithDuration:1.0 delay:0.5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        // 动画的代码
        CGRect frame = self.animationView.frame;
        frame.size = CGSizeMake(200, 150);
        self.animationView.frame = frame;
    } completion:^(BOOL finished) {
        // 动画的代码
        if (self.animationView.center.x > self.view.frame.size.width) {
            
            NSLog(@"动画完成");
        }
    }];
}

- (IBAction)alpha:(UIButton *)sender {
    [UIView animateWithDuration:1.0 delay:0.5f options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.animationView.alpha -= 0.1f;
    } completion:^(BOOL finished) {
        if (self.animationView.alpha == 0.0f) {
            [UIView animateWithDuration:0.2 animations:^{
                self.animationView.alpha = 1.0f;
            }];
        }
        NSLog(@"动画完成");
    }];
}
@end
