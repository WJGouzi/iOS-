//
//  ViewController.m
//  04-隐式动画
//
//  Created by gouzi on 2017/7/19.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(50, 50, 100, 100);
    [self.view.layer addSublayer:layer];
    self.layer = layer;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [CATransaction begin];
    [CATransaction setDisableActions:NO]; // 开启或取消动画
    [CATransaction setAnimationDuration:1.5]; // 设置动画的时间
    self.layer.position = CGPointMake(100, 400); // 非根层的layer才会有的隐式动画
    self.layer.bounds = CGRectMake(0, 0, 200, 200);
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    [CATransaction commit];
}


@end
