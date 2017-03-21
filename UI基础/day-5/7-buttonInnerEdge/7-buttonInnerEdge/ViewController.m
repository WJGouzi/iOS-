//
//  ViewController.m
//  7-buttonInnerEdge
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置按钮的内边距
    // 设置内容
//    self.btn.contentEdgeInsets = UIEdgeInsetsMake(10, 0, 0, 0); // 上左下右
    
    
    // 设置图片
    self.btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    // 设置标题
    self.btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
}


@end
