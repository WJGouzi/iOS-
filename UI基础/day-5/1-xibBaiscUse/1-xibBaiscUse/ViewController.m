//
//  ViewController.m
//  1-xibBaiscUse
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 加载xib
    // 方式一
    UIView *carListView = [[[NSBundle mainBundle] loadNibNamed:@"carView" owner:nil options:nil] firstObject];
    carListView.frame = CGRectMake(0, 100, 375, 96);
    [self.view addSubview:carListView];
    
    
    // 方式二
    UINib *xib = [UINib nibWithNibName:@"carView" bundle:[NSBundle mainBundle]]; // bundle  可以传nil，他可以自行查找
    UIView *carView = [[xib instantiateWithOwner:nil options:nil] firstObject];
    [self.view addSubview:carView];
    
}


@end
