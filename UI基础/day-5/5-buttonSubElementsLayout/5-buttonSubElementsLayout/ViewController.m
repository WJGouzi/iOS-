//
//  ViewController.m
//  5-buttonSubElementsLayout
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import "wjButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    wjButton *btn = [wjButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 100, 170, 70);
    btn.backgroundColor = [UIColor redColor];
    
    // 设置文字
    [btn setTitle:@"普通按钮" forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"miniplayer_btn_playlist_normal"] forState:UIControlStateNormal];
    
    // 改变位置
    btn.imageView.backgroundColor = [UIColor yellowColor];
    btn.titleLabel.backgroundColor = [UIColor purpleColor];
    
    // 这种方法是不能修改掉按钮内部的frame的，内部会自动覆盖掉
    /*
    btn.titleLabel.frame = CGRectMake(0, 0, 100, 70);
    btn.imageView.frame = CGRectMake(100, 0, 70, 70);
    */
    
    
    [self.view addSubview:btn];
}


@end
