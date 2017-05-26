//
//  ViewController.m
//  1-transform
//
//  Created by gouzi on 2017/5/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     
}

- (IBAction)moveUp:(UIButton *)sender {
    [UIView animateWithDuration:0.5 animations:^{
        // 使用MAKE --- 相对于是最原始的位置进行平移做的形变。
//        self.imageView.transform = CGAffineTransformMakeTranslation(0, -100);
        
        // 相对于上一次进行平移
        self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 0, -10);
    }];
}

- (IBAction)moveDown:(UIButton *)sender {
  self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, 0, 100);
}

- (IBAction)rotateAction:(UIButton *)sender {
    // angle是个弧度
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, M_PI_4);
    }];
}

- (IBAction)scaleAction:(UIButton *)sender {
    // 原始比例是1，
    // 大于1是放大操作
    // 小于1是缩放操作
    [UIView animateWithDuration:0.5 animations:^{
        self.imageView.transform = CGAffineTransformScale(self.imageView.transform, 0.5, 0.5);
    }];
}


@end
