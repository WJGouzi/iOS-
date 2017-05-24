//
//  ViewController.m
//  2-裁剪图片带边框
//
//  Created by gouzi on 2017/5/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 边框的宽度是10
    
    UIImage *image = [UIImage imageNamed:@"ali"];
    // 1确定边框宽度
    CGFloat borderW = 10.f;
    // 2开启一个上下文
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    // 3绘制大圆显示出来
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [[UIColor orangeColor] set];
    [path fill];
    // 4绘制小圆->把小圆设置成裁剪区域
    UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [clipPath addClip];
    // 5把图片绘制上下文中
    [image drawAtPoint:CGPointMake(borderW, borderW)];
    // 6把上下文中的图片取出来
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 7关闭上下文
    UIGraphicsEndImageContext();
    self.imageView.image = newImg;

}


@end
