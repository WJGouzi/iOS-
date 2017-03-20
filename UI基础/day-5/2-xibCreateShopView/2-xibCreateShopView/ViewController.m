//
//  ViewController.m
//  2-xibCreateShopView
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import "wjShopView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加载xib
//    wjShopView *shopView = [[[NSBundle mainBundle] loadNibNamed:@"wjShopView" owner:nil options:nil] firstObject];
    wjShopView *shopView = [wjShopView shopView];
    shopView.frame = CGRectMake(100, 100, 80, 100);
    
    [shopView setTitleName:@"单肩包"];
    [shopView setIconImage:@"danjianbao"];
    [self.view addSubview:shopView];
}


@end
