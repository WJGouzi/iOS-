//
//  ViewController.m
//  6-resourceStorage
//
//  Created by gouzi on 2017/3/14.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

/*
 *  加载图片的方式：
 *  1.imageNamed:
 *  2.pathForResource:
 *
 1. 加载Assets.xcassets这里面的图片:
 1> 打包后变成Assets.car
 2> 拿不到路径
 3> 只能通过imageNamed:来加载图片
 4> 不能通过imageWithContentsOfFile:来加载图片
 
 2. 放到项目中的图片:
 1> 可以拿到路径
 2> 能通过imageNamed:来加载图片
 3> 也能通过imageWithContentsOfFile:来加载图片
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 图片的设置方式
    // 1、方式一
    self.imageView.image = [UIImage imageNamed:@"1"];
    
    // 2、方式二 在资源包中去查找
    self.imageView.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"1.png" ofType:@""]]; // 传路径
    
}


@end
