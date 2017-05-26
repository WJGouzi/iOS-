//
//  ViewController.m
//  5-超出父控件的子控件跟随父控件移动
//
//  Created by gouzi on 2017/5/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btnClickAction:(UIButton *)sender {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"对话框"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"小孩"] forState:UIControlStateHighlighted];
    
    btn.frame = CGRectMake(100, -80, 100, 80);
    [sender addSubview:btn];
}


@end
