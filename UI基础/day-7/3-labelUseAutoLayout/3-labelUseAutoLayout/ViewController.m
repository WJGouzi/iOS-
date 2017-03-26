//
//  ViewController.m
//  3-labelUseAutoLayout
//
//  Created by gouzi on 2017/3/26.
//  Copyright © 2017年 王钧. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


/**
 storyboard中的设置，label和父控件是居中对齐的，label的宽不超过150
 设置自动换行
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.label.text = @"asdasdasdasdasdasdasdasdasdas";
}

@end
