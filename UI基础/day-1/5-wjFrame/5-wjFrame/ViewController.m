//
//  ViewController.m
//  5-wjFrame
//
//  Created by gouzi on 2017/3/13.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(30, 40, 40, 60);
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    self.label = label;
}


- (IBAction)bounds {
    // 改变尺寸  iOS9以后, 中心点不变,向四周延伸
    self.label.bounds = CGRectMake(0, 0, 200, 120);
}


- (IBAction)center {
    // 改变位置
    //    self.label.center = CGPointMake(100, 100);
    
    // 显示在最中间
    self.label.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.5);
    
}

- (IBAction)changeFrame {
    // 方式1
    //    self.label.frame = CGRectMake(200, 100, 100, 60);
    
    // 方式2
    self.label.frame = (CGRect){{100, 100}, {100, 100}};
    
    // 方式3
    // 结构体是值传递,不是地址传递
    //    self.label.frame.size.width += 100; // 不可取
    CGRect frame = self.label.frame;
    //    frame.origin.x -= 100; // 改变x值
    //    frame.origin.y += 100; // 改变y值
    //    frame.size.width += 50; // 改变宽度
    frame.size.height += 100; // 改变高度
    self.label.frame = frame;
    
    
}

@end
