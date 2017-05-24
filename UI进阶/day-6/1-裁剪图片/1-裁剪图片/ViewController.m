//
//  ViewController.m
//  1-裁剪图片
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
    
    
    UIImage *image = [UIImage imageNamed:@"ali"];
    // 1开启一个上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 2.设置圆形裁剪区域
    // 2.1绘制一个圆形
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    // 2.2把圆形的路径设置成一个裁剪区域
    [path addClip]; // 超过区域的地方是被裁剪掉了。
    // 3.把图片绘制到上下文中（把超过的区域内容进行裁剪掉）
    [image drawAtPoint:CGPointZero];
    // 4.把上下文中的图片取出来
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 5.关闭上下文
    UIGraphicsEndImageContext();
    self.imageView.image = newImg;
}


@end
