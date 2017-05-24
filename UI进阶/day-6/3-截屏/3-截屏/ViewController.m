//
//  ViewController.m
//  3-截屏
//
//  Created by gouzi on 2017/5/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // 点击图片就截屏操作



}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 把控制器的view生成一个图片
    // 1.开启位图上下文（和当前的view的尺寸一样大小的的尺寸）
    UIGraphicsBeginImageContextWithOptions(self.view.bounds.size, NO, 0);
    // 2.把控制器的view绘制到上下文中
    // 想要把UIView的东西绘制到上下文中，必须是使用到渲染操作
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:ctx];
    // 3.从上文中生成一张图片
    UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    
    // 把生成的图片写入到mac桌面上(以文件的方式进行传输,二进制流的形式进行传输)
    NSData *data = UIImageJPEGRepresentation(newImg, 1);
    [data writeToFile:@"/Users/wangjun/Desktop/截屏.jpg" atomically:YES];

    
}




@end
