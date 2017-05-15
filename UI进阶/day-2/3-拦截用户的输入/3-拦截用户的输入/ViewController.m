//
//  ViewController.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *wjCountryTextField;

@property (weak, nonatomic) IBOutlet UITextField *wjCityTextField;

@property (weak, nonatomic) IBOutlet UITextField *wjBirthdayTextField;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


#pragma mark - UITextFieldDelegate


/**
 是否允许开始编辑
 */
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return YES;
}


/**
 开始编辑时调用,成为第一响应者进行调用
 */
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"%s", __func__);
}

/**
 是否允许结束编辑
 */
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    return YES;
}


/**
 结束编辑的时候进行调用
 */
- (void)textFieldDidEndEditing:(UITextField *)textField {
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
