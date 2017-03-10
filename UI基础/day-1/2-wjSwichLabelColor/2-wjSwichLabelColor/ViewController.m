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

@property (weak, nonatomic) IBOutlet UIButton *redBtn;
@property (weak, nonatomic) UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

// 一个按钮可以连接多个方法，同理一个对象可以连接多个属性(但是没有这个必要)



/*
    判断一个对象是否能连线方法:
    1、在storyboard中查看这个对象是否有sentEvent，有就可以
    2、看该对象是否继承自UIControl
 
    经典错误
    1、错误一 （属性的错误）
        在.m或.h中的interface中注释掉属性，但是storyboard中对象的多余的属性连线没有删除
    2、错误二 （方法的错误）
        在.m中注释掉的相关方法，运行点击时的崩溃，是找不到相关的方法。
        需要添加对应的方法或者是删除storyboard中对象多余的连线
 
 */


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
    self.redBtn.backgroundColor = [UIColor redColor];
}

- (IBAction)greenBtnClick:(UIButton *)btn {
    self.colorlabel.textColor = [UIColor greenColor];
    NSLog(@"%s", __func__);
    self.colorlabel.text = @"绿色的文字";
    self.colorlabel.backgroundColor = [UIColor redColor];
    self.colorlabel.textAlignment = NSTextAlignmentCenter;
    //
    btn.backgroundColor = [UIColor redColor];
}

- (IBAction)blueBtnClick:(UIButton *)btn {
    self.colorlabel.textColor = [UIColor blueColor];
    NSLog(@"%s", __func__);
    self.colorlabel.text = @"蓝颜色";
    self.colorlabel.backgroundColor = [UIColor yellowColor];
    self.colorlabel.textAlignment = NSTextAlignmentCenter;
}


@end
