//
//  ViewController.m
//  3-UIImageViewUse
//
//  Created by gouzi on 2017/3/13.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 毛玻璃效果
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = self.view.bounds;
    imageView.backgroundColor = [UIColor redColor];
    imageView.image = [UIImage imageNamed:@"10025372,3360,2100"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    // 加毛玻璃
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.frame = imageView.bounds;
    // 设置毛玻璃的样式
    toolBar.barStyle = UIBarStyleBlack;
    toolBar.alpha = 0.98;
    [imageView addSubview:toolBar];
    
    [self.view addSubview:imageView];
    
}

// UIImageView的使用
- (void)test {
    // 1.1创建对象
    UIImageView *imageView = [[UIImageView alloc] init];
    // 1.2设置frame
    imageView.frame = CGRectMake(100, 100, 200, 75);
    // 1.3设置背景
    imageView.backgroundColor = [UIColor greenColor ];
    // 1.4设置图片(png图片不需要加后缀)
    imageView.image = [UIImage imageNamed:@"10025372,3360,2100"];
    // 1.5设置图片的模式
    /*
     // 带scale的有可能会被拉伸或压缩
     UIViewContentModeScaleToFill,  完全的压缩或拉伸
     // 带有aspect是带有比例的缩放或拉伸
     UIViewContentModeScaleAspectFit,   宽高比不变，fit适应
     UIViewContentModeScaleAspectFill,  宽高比不变，fill填充
     
     // 不带scale的不可能被拉伸或压缩
     UIViewContentModeRedraw, (核心绘图有用到)
     UIViewContentModeCenter,
     UIViewContentModeTop,
     UIViewContentModeBottom,
     UIViewContentModeLeft,
     UIViewContentModeRight,
     UIViewContentModeTopLeft,
     UIViewContentModeTopRight,
     UIViewContentModeBottomLeft,
     UIViewContentModeBottomRight,
     */
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    // 1.6裁剪多余的部分
    imageView.clipsToBounds = YES;
    
    // 2.0添加到控制器的view中
    [self.view addSubview:imageView];
}



@end
