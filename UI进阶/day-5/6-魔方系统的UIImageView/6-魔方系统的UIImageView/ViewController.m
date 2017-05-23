//
//  ViewController.m
//  6-魔方系统的UIImageView
//
//  Created by gouzi on 2017/5/23.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjImageView.h"


@interface ViewController ()

@property (nonatomic, strong) UIImageView *imgV;

/**  */
@property (nonatomic, strong) wjImageView *wjImgV;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    UIImageView *imageView = [[UIImageView alloc] init];
//    imageView.frame = CGRectMake(0, 0, 300, 300);
//    imageView.image = [UIImage imageNamed:@"CTO"];
//    [self.view addSubview:imageView];
//    self.imgV = imageView;

    
    // init创建了一个跟原始图片一样大的iamgeview
//    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"CTO"]];
//    [self.view addSubview:imageV];
    
    
    // 干掉系统的
//    wjImageView *wjImgV = [[wjImageView alloc] init];
//    wjImgV.frame = CGRectMake(0, 0, 300, 300);
//    wjImgV.image = [UIImage imageNamed:@"CTO"];
//    [self.view addSubview:wjImgV];
//    self.wjImgV = wjImgV;
    
    wjImageView *imageV = [[wjImageView alloc] initWithImage:[UIImage imageNamed:@"CTO"]];
    [self.view addSubview:imageV];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 切换图片
//    self.imgV.image = [UIImage imageNamed:@"water"];
    self.wjImgV.image = [UIImage imageNamed:@"water"];
}


@end
