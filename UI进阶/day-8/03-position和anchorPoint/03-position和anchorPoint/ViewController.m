//
//  ViewController.m
//  03-position和anchorPoint
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
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:layer];
    self.layer = layer;
    NSLog(@"anchorPoint : %@", NSStringFromCGPoint(layer.anchorPoint));
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [UIView animateWithDuration:0.5 animations:^{
        self.layer.position = self.view.center;
//        self.layer.anchorPoint = CGPointMake(0.5, 0.5);
        
        NSLog(@"touched anchorPoint : %@", NSStringFromCGPoint(self.layer.anchorPoint));
        // 无论修改 position 或 anchorPoint 属性，layer都会移动的
        // UIView的center也就是CALayer中的position
    }];
}





@end
