//
//  ViewController.m
//  2-UIApplication功能
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import <UserNotifications/UserNotifications.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
}

- (IBAction)setNoticeImage:(UIButton *)sender {
    // 注册通知
    // iOS10之后就过期了
    UIUserNotificationSettings *notice = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:notice];
    // 设置提醒值
    [UIApplication sharedApplication].applicationIconBadgeNumber = 10;
}

- (IBAction)setNetworkStatus:(UIButton *)sender {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}


- (IBAction)setStatusBar:(UIButton *)sender {
    [UIApplication sharedApplication].statusBarHidden = NO;
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}


#warning 默认的是每个控制器都管理着状态栏，可以在plist文件中进行设置，让当前控制前不能进行管理状态栏， 也意味着下面的两个方法失效了
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

// 隐藏状态栏
- (BOOL)prefersStatusBarHidden {
    return NO;
}


- (IBAction)openWebPage:(UIButton *)sender {
    // 打电话
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"] options:@{@"tel" : @"10086"} completionHandler:^(BOOL success) {
        NSLog(@"yes");
    }];
    
//    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel://10086"]];
    
    // 发短信
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"sms://10086"] options:@{@"content" : @"cao"} completionHandler:^(BOOL success) {
        NSLog(@"niubi");
    }];
    
    // 发邮件
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto://12345@qq.com"] options:@{@"mail" : @"1232`"} completionHandler:^(BOOL success) {
        NSLog(@"ri");
    }];
    
    // 打开网页
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.baidu.com"] options:@{@"stauts" : @"ok"} completionHandler:^(BOOL success) {
        NSLog(@"is success %d", success);
    }];
    
}

@end
