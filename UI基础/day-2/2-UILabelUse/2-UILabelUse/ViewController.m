//
//  ViewController.m
//  2-UILabelUse
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
    
    // 1.1创建label对象
    UILabel *label = [[UILabel alloc] init];
    // 1.2尺寸、位置
    label.frame = CGRectMake(100, 100, 200, 75);
    // 1.3设置背景延时
    label.backgroundColor = [UIColor redColor];
    // 1.4设置文字
    label.text = @"512最牛逼了";
    // 1.5居中
    label.textAlignment = NSTextAlignmentCenter;
    // 1.6字体大小
    label.font = [UIFont boldSystemFontOfSize:20.f]; // 加粗
    label.font = [UIFont italicSystemFontOfSize:20.f]; // 斜体
    // 1.7设置文字颜色
    label.textColor = [UIColor purpleColor];
    // 1.8阴影颜色(默认有值的)
    label.shadowColor = [UIColor whiteColor];
    // 1.9阴影的偏移量
    label.shadowOffset = CGSizeMake(2, 2);
    // 1.10显示模式
    label.lineBreakMode = NSLineBreakByTruncatingMiddle;
    // 1.11显示行数(0代表的是自动换行)
    label.numberOfLines = 0;
    
    
    // 2.0添加到控制器的view中
    [self.view addSubview:label];

}




@end
