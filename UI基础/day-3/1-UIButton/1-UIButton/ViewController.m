//
//  ViewController.m
//  1-UIButton
//
//  Created by gouzi on 2017/3/15.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 150, 60);
//    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setTitle:@"高亮" forState:UIControlStateHighlighted];
    
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    
    // 设置文字的阴影状态
    [btn setTitleShadowColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleShadowColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    // 设置阴影的偏移量
    btn.titleLabel.shadowOffset = CGSizeMake(2, 2);
    
    [btn setImage:[UIImage imageNamed:@"player_btn_pause_normal"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"player_btn_pause__highlight"] forState:UIControlStateHighlighted];
//    btn.imageView.backgroundColor = [UIColor purpleColor];
    
    // 设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
    [self.view addSubview:btn];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)btnClick:(UIButton *)btn {
    
    btn.enabled = NO;
}

@end
