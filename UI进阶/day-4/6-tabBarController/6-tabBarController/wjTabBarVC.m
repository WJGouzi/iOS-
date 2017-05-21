//
//  wjTabBarVC.m
//  6-tabBarController
//
//  Created by gouzi on 2017/5/21.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjTabBarVC.h"
#import "wjFirstViewController.h"
#import "wjSecondViewController.h"

@interface wjTabBarVC ()

@end

@implementation wjTabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tabBarControllerWithSubController:[[wjFirstViewController alloc] init] titile:@"first"];
    [self tabBarControllerWithSubController:[[wjSecondViewController alloc] init] titile:@"second"];
    self.selectedIndex = 1; // 开启程序的时候指定默认的控制器。
}

- (void)tabBarControllerWithSubController:(UIViewController *)vc titile:(NSString *)title {
    vc.title = title;
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = [NSString stringWithFormat:@"vc-%@", title];
//    nav.tabBarItem.badgeValue = @"1";
    nav.tabBarItem.image = [UIImage imageNamed:@"tab_qworld_nor"];
    [self addChildViewController:nav];
}



@end
