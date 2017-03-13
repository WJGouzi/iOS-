//
//  ViewController.m
//  1-addCaculate
//
//  Created by gouzi on 2017/3/13.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNumber;

@property (weak, nonatomic) IBOutlet UITextField *secondNumber;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultLabel.text = nil;
}

- (IBAction)sumAculate {
    // 1.拿到两个输入框的字符串
    NSString *str1 = self.firstNumber.text;
    NSString *str2 = self.secondNumber.text;
    // 2.把字符串转成一个数值
    if (str1.length == 0 | str2.length == 0) {
        NSLog(@"请输入齐全");
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"输入有误" message:@"请输入齐全" delegate:self cancelButtonTitle:@"我知道了" otherButtonTitles:nil, nil];
        [alertView show];
        return;
    }
    NSInteger num1 = [str1 integerValue];
    NSInteger num2 = [str2 integerValue];
    // 3.相加
    NSInteger result = num1 + num2;
    // 4.显示赋值
    self.resultLabel.text = [NSString stringWithFormat:@"%ld", result];
}

@end
