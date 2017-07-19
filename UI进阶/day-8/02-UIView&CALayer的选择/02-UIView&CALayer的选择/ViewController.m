//
//  ViewController.m
//  02-UIView&CALayer的选择
//
//  Created by gouzi on 2017/7/19.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(50, 100, 100, 150);
    [self.view.layer addSublayer:layer];
    
    layer.contents = (id)[UIImage imageNamed:@"gagi"].CGImage;
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITextView *textView = [[UITextView alloc] init];
    textView.frame = CGRectMake(50, 270, 250, 300);
    textView.backgroundColor = [UIColor lightGrayColor];
    NSString *text = @"               关于CALayer的疑惑           \n首先\n1.CALayer是定义在QuartzCore框架中\n2.CGImgaRef、CGColorRef是定义在CoreGraphics框架中\n其次\n1.QuartzCore和CoreGraphics是可以跨平台使用的\n2.为了保证移植性，QuartzCore不能使用UIImage和UIColor，只能使用CGImgaRef和CGColorRef\n               UIView和CALayer的选择          \n1.CALayer和UIView相比少了一个事件处理的功能，CALayer不能处理用户的触摸事件，而UIView是可以的(UIView是继承自UIResponder而CALayer没有继承)s\n2.如果只是单纯的展示内容，两者都可以；但是要处理用户的触摸事件就只能用UIView\n3.当然在性能上，CALayer的性能要优于UIView，毕竟少了事件处理，更加的轻量级了。";
    textView.text = text;
    textView.editable = NO;
    [self.view addSubview:textView];
}

@end
