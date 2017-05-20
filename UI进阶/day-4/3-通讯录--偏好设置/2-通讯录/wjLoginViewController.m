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


#define kUserID         @"userID"
#define kPassword       @"pwd"
#define kIsRemember     @"isRemember"
#define kIsAutoLogin    @"isAutoLogin"



@interface wjLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *wjUserIdTextField;

@property (weak, nonatomic) IBOutlet UITextField *wjPwdTextField;

@property (weak, nonatomic) IBOutlet UIButton *wjLoginBtn;

@property (weak, nonatomic) IBOutlet UISwitch *wjRememberSwitch;

@property (weak, nonatomic) IBOutlet UISwitch *wjAutoLoginSwitch;

@end

@implementation wjLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"欢迎进入通讯录";
    
    [self readPreferencesFromHomeDirectory];
    
    [self.wjUserIdTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.wjPwdTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    
    [self textChange];
    
}

- (void)readPreferencesFromHomeDirectory {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.wjRememberSwitch.on = [defaults boolForKey:kIsRemember];
    self.wjAutoLoginSwitch.on = [defaults boolForKey:kIsAutoLogin];
    if (self.wjRememberSwitch.on) {
        self.wjUserIdTextField.text = [defaults objectForKey:kUserID];
        self.wjPwdTextField.text = [defaults objectForKey:kPassword];
        if (self.wjAutoLoginSwitch.on) {
            [self wjLoginBtnClickAction:self.wjLoginBtn];
        }
    }
    
    
}


- (void)textChange {
    self.wjLoginBtn.enabled = self.wjPwdTextField.text.length && self.wjUserIdTextField.text.length;
}

- (IBAction)wjLoginBtnClickAction:(UIButton *)sender {
    if ([self.wjUserIdTextField.text isEqualToString:@"wangjun"] && [self.wjPwdTextField.text isEqualToString:@"123456"]) {
        wjAlertSimpleView *noticeView = [[wjAlertSimpleView alloc] initWithNoticeIndicatorWithTitle:@"正在登陆中..." dismissTime:1.5];
        [self.view addSubview:noticeView];
        
        // 保存用户名和密码到沙盒里
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.wjUserIdTextField.text forKey:kUserID];
        [defaults setObject:self.wjPwdTextField.text forKey:kPassword];
        [defaults setBool:self.wjRememberSwitch.on forKey:kIsRemember];
        [defaults setBool:self.wjAutoLoginSwitch.on forKey:kIsAutoLogin];
        [defaults synchronize];
        NSLog(@"home is %@", NSHomeDirectory());
        
        wjContactViewController *contactVC = [[wjContactViewController alloc] init];
        contactVC.titleText = self.wjUserIdTextField.text;
        
        [self.navigationController pushViewController:contactVC animated:YES];
        
    } else {
        wjAlertSimpleView *warnView = [[wjAlertSimpleView alloc] initWithNoticeTitle:@"账号或密码输入错误，请核对!"];
        [self.view addSubview:warnView];
    }
}



@end
