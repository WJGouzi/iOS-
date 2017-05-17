//
//  wjLoginViewController.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjLoginViewController.h"
#import "wjAlertSimpleView.h"
#import "wjContactViewController.h"

@interface wjLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *wjUserIdTextField;

@property (weak, nonatomic) IBOutlet UITextField *wjPwdTextField;

@property (weak, nonatomic) IBOutlet UIButton *wjLoginBtn;
@end

@implementation wjLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"欢迎进入通讯录";
    [self.wjUserIdTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.wjPwdTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    // 进入到控制器就要进行判断
    [self textChange];
    
}

- (void)textChange {
    self.wjLoginBtn.enabled = self.wjPwdTextField.text.length && self.wjUserIdTextField.text.length;
}

- (IBAction)wjLoginBtnClickAction:(UIButton *)sender {
    // 判断用户名和密码是否正确,正确后才跳转
    // 这里就固定一个用户作为判断
    if ([self.wjUserIdTextField.text isEqualToString:@"wangjun"] && [self.wjPwdTextField.text isEqualToString:@"123456"]) {
        // 提醒用户正在登陆
        wjAlertSimpleView *noticeView = [[wjAlertSimpleView alloc] initWithNoticeIndicatorWithTitle:@"正在登陆中..." dismissTime:1.5];
        [self.view addSubview:noticeView];
        
        wjContactViewController *contactVC = [[wjContactViewController alloc] init];
        contactVC.titleText = self.wjUserIdTextField.text;
        [self.navigationController pushViewController:contactVC animated:YES];
        
    } else {
        // 提醒用户输入错误
        wjAlertSimpleView *warnView = [[wjAlertSimpleView alloc] initWithNoticeTitle:@"账号或密码输入错误，请核对!"];
        [self.view addSubview:warnView];
    }
}



@end
