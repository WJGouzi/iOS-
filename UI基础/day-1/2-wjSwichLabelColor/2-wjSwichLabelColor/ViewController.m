//
//  ViewController.m
//  2-wjSwichLabelColor
//
//  Created by gouzi on 2017/3/10.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 已经有强指针指向，所以不用strong，用weak
@property (weak, nonatomic) IBOutlet UILabel *colorlabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - 按钮的点击事件
- (IBAction)redBtnClick:(UIButton *)btn {
    self.colorlabel.textColor = [UIColor redColor];
    NSLog(@"%s", __func__);
    // 改变文本的内容
    self.colorlabel.text = @"我是一段红色的文字";
    // 改变背景颜色
    self.colorlabel.backgroundColor = [UIColor lightGrayColor];
    // 居中
    self.colorlabel.textAlignment = NSTextAlignmentCenter;
    // 文字大小
    self.colorlabel.font = [UIFont systemFontOfSize:18.0f];
}

- (IBAction)greenBtnClick:(UIButton *)btn {
    self.colorlabel.textColor = [UIColor greenColor];
    NSLog(@"%s", __func__);
    self.colorlabel.text = @"绿色的文字";
    self.colorlabel.backgroundColor = [UIColor redColor];
    self.colorlabel.textAlignment = NSTextAlignmentCenter;
}

- (IBAction)blueBtnClick:(UIButton *)btn {
    self.colorlabel.textColor = [UIColor blueColor];
    NSLog(@"%s", __func__);
    self.colorlabel.text = @"蓝颜色";
    self.colorlabel.backgroundColor = [UIColor yellowColor];
    self.colorlabel.textAlignment = NSTextAlignmentCenter;
}


@end
