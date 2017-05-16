//
//  wjLoginVC.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/16.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjLoginVC.h"
#import "wjContactVC.h"
#import "wjAlertSimpleView.h"

@interface wjLoginVC () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *wjUserIDTextField;
@property (weak, nonatomic) IBOutlet UITextField *wjPasswordTextField;

@property (weak, nonatomic) IBOutlet UIButton *wjLoginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *wjRememberPwdSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *wjAutoLoginSwtich;
@end

@implementation wjLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 监听，账号和密码同时有值的时候才可按
//    self.wjUserIDTextField.delegate = self;
//    self.wjPasswordTextField.delegate = self;
    [self.wjUserIDTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.wjPasswordTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    // 进入到控制器就要进行判断
    [self textChange];
    
}


- (IBAction)wjLoginBtnAction:(UIButton *)sender {
    // 判断用户名和密码是否正确,正确后才跳转
    // 这里就固定一个用户作为判断
    if ([self.wjUserIDTextField.text isEqualToString:@"wangjun"] && [self.wjPasswordTextField.text isEqualToString:@"123456"]) {
        // 提醒用户正在登陆
        wjAlertSimpleView *noticeView = [[wjAlertSimpleView alloc] initWithNoticeIndicatorWithTitle:@"正在登陆中..." dismissTime:1.5];
        [self.view addSubview:noticeView];
        // 手动执行线的操作->segue
        [self performSegueWithIdentifier:NSStringFromClass([wjContactVC class]) sender:nil];
    } else {
        // 提醒用户输入错误
        wjAlertSimpleView *warnView = [[wjAlertSimpleView alloc] initWithNoticeTitle:@"账号或密码输入错误，请核对!"];
        [self.view addSubview:warnView];
    }
}


// 准备跳转之前进行调用
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // 把值传给通信录界面
    wjContactVC *contact = (wjContactVC *)segue.destinationViewController; // 跳转的控制器
//    segue.sourceViewController // 从哪个控制器跳转到的
    contact.titleText = self.wjUserIDTextField.text;
}


// 当文本框内容发生变化的时候调用
- (void)textChange {
//    if (self.wjUserIDTextField.text.length && self.wjPasswordTextField.text.length) {
//        self.wjLoginBtn.enabled = YES;
//    } else {
//        self.wjLoginBtn.enabled = NO;
//    }
    self.wjLoginBtn.enabled = self.wjPasswordTextField.text.length && self.wjUserIDTextField.text.length;
}

/*
#pragma mark - UITextFieldDelegate
// 这个方法不能使用，是因为在第二次的时候才会调用
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (self.wjUserIDTextField.text.length && self.wjPasswordTextField.text.length) {
        self.wjLoginBtn.enabled = YES;
    } else {
        self.wjLoginBtn.enabled = NO;
    }

    return YES;
}
*/

- (IBAction)wjRememberPwdAction:(UISwitch *)sender {
    if (self.wjRememberPwdSwitch.on == NO) {
//        self.wjAutoLoginSwtich.on = NO;
        [self.wjAutoLoginSwtich setOn:NO animated:YES];
    }
}

- (IBAction)wjAutoLoginAction:(UISwitch *)sender {
    if (self.wjAutoLoginSwtich.on == YES) {
        [self.wjRememberPwdSwitch setOn:YES animated:YES];
    }
}


@end
