//
//  ViewController.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+initial.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *wjCountryTextField;

@property (weak, nonatomic) IBOutlet UITextField *wjCityTextField;

@property (weak, nonatomic) IBOutlet UITextField *wjBirthdayTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

#pragma mark - UITextFieldDelegate

/**
 开始编辑时调用,成为第一响应者进行调用
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    // 使用分类，对方法进行重写
    // 让当前的文本框选中第一个
    if (textField == self.wjCountryTextField) {
        [textField initWithText];
    } else if (textField == self.wjBirthdayTextField) {
        [textField initWithBirthday];
    } else {
        [textField initWithProvinceAndCity];
    }
    
    // 或者每个每个文本框都使用同一个初始化方法进行调用
    // 就可以不用进行判断
//    [textField initWithText];
    
    
    NSLog(@"%s", __func__);
}



/**
 是否允许改变文本框的内容
 * 拦截用户的输入
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    return NO;
}


@end
