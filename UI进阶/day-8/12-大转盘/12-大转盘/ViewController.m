//
//  ViewController.m
//  12-大转盘
//
//  Created by gouzi on 2017/7/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjWheelView.h"

@interface ViewController ()

@property (nonatomic, weak) wjWheelView *wheelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wjSetUp];
}


/**
 创建UI
 */
- (void)wjSetUp {
    wjWheelView *wheelView = [wjWheelView wheelView];
    wheelView.center = self.view.center;
    [self.view addSubview:wheelView];
    self.wheelView = wheelView;
}


- (IBAction)wjRotateAction:(UIButton *)sender {
    [self.wheelView rotate];
}

- (IBAction)wjStopAction:(UIButton *)sender {
    [self.wheelView stop];
}

@end
