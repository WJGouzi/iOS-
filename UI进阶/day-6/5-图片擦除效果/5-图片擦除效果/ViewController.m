//
//  ViewController.m
//  5-图片擦除效果
//
//  Created by gouzi on 2017/5/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.userInteractionEnabled = YES;
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.imageView addGestureRecognizer:pan];
}

- (void)panAction:(UIGestureRecognizer *)pan {
    CGPoint currentPoint = [pan locationInView:self.view];
    // 先确定擦除的区域
    CGFloat panWH = 30;
    CGFloat x = currentPoint.x - panWH * 0.5;
    CGFloat y = currentPoint.y - panWH * 0.5;
    CGRect rect = CGRectMake(x, y, panWH, panWH);
    
    // 擦除图片
    // 生成一张带有透明的擦除区域的图片
    UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.imageView.layer renderInContext:ctx];
    // 擦除确定的区域
    CGContextClearRect(ctx, rect);
    //
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.imageView.image = newImg;
    
}



@end
