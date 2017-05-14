//
//  wjTabBarViewController.m
//  UIBasicTestDemo
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjTabBarViewController.h"
#import "wjContactVC.h"
#import "wjBookTagVC.h"

@interface wjTabBarViewController ()

@end

@implementation wjTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tabBarWithViewController:[[wjContactVC alloc] init] tabbarName:@"联系人" normalImage:@"tabbar_contacts" selectedImage:@"tabbar_contactsHL"];
    [self tabBarWithViewController:[[wjBookTagVC alloc] init] tabbarName:@"书签" normalImage:@"tabbar_mainframe" selectedImage:@"tabbar_mainframeHL"];
    
}


- (void)tabBarWithViewController:(UIViewController *)vc tabbarName:(NSString *)tabName normalImage:(NSString *)normalIamgeName selectedImage:(NSString *)selectedImageName {
    vc.title = tabName;
    vc.tabBarItem.image = [[UIImage imageNamed:normalIamgeName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImageName] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor lightGrayColor]} forState:UIControlStateNormal];
    [vc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor orangeColor]} forState:UIControlStateSelected];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

@end
