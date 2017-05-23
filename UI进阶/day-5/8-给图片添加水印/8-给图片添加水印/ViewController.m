//
//  ViewController.m
//  8-给图片添加水印
//
//  Created by gouzi on 2017/5/23.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *wjImageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 位图上下文必须手动开启，开启多大的上下文，图片就有多大
    // 这不是在view上画东西，所以不需要自定义view
    
    
    UIImage *image = [UIImage imageNamed:@"gagi.jpg"];
    // 1.开启跟图片一样大小尺寸的上下文
    // opaque:代表的是不透明度
    // scale:0代表的是当前设备的分辨率
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    // 2.将图片绘制到上下文中
    [image drawAtPoint:CGPointZero];
    // 3.把文字绘制到上下文中
    NSString *str = @"@请输入账号名";
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor redColor],
                           NSFontAttributeName : [UIFont systemFontOfSize:25.0f]
                           };
    [str drawAtPoint:CGPointMake(image.size.width - str.length * 25.0f - 20, image.size.height - 30) withAttributes:dict];
    // 4.从上下文当中重新生成一张图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    // 5.关闭上下文(因为这个上下文是自己手动关闭的)
    UIGraphicsEndImageContext();
    self.wjImageView.image = newImage;
}





@end
