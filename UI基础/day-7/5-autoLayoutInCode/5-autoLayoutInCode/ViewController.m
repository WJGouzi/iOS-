//
//  ViewController.m
//  5-autoLayoutInCode
//
//  Created by gouzi on 2017/3/26.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self redViewAutoLayout];
    
}

- (void)redViewAutoLayout {
    UIView *redView = [[UIView alloc] init ];
    redView.backgroundColor = [UIColor redColor];
    // 禁止redView的AutoResizing自动转换约束
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:redView];
    
    // 添加约束
    NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0.0 constant:100];
    NSLayoutConstraint *heightConstraint  =[NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:0 multiplier:0.0 constant:100];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    [redView addConstraints:@[widthConstraint, heightConstraint]];
    [self.view addConstraints:@[rightConstraint, bottomConstraint]];
}

@end
