//
//  ViewController.m
//  6-masonry的使用
//
//  Created by gouzi on 2017/3/29.
//  Copyright © 2017年 gouzi. All rights reserved.
//

#import "ViewController.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.蓝色的view
    UIView *blueView = [[UIView alloc] init];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    // 2.红色的view
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    /*** 添加新的约束 ***/
    // 3.设置蓝色view的约束
    [blueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).offset(30);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-30);
        make.right.mas_equalTo(redView.mas_left).offset(-30);
        make.width.mas_equalTo(redView.mas_width);
    }];
    
    
    
    // 4.设置红色view的约束
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.top.equalTo(blueView.mas_top);
        make.bottom.equalTo(blueView.mas_bottom);
    }];
    
    /*** 更新约束 ****/
    [blueView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(80);
    }];
    
    // 删除之前所有的约束,添加新的约束 （不常用）
    //    [blueView remakeConstraints:^(MASConstraintMaker *make) {
    //
    //    }];
}


- (void)redView {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.width.equalTo(@100);
    //        make.height.equalTo(@100);
    //        make.centerX.equalTo(self.view.mas_centerX);
    //        make.center.equalTo(self.view.mas_centerY);
    //
    //    }];
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.width.mas_equalTo(100);
    //        make.height.mas_equalTo(100);
    //        make.centerX.equalTo(self.view.mas_centerX);
    //        make.center.equalTo(self.view.mas_centerY);
    //
    //    }];
    
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.width.mas_equalTo(100);
        //        make.height.mas_equalTo(100);
        make.size.mas_equalTo(CGSizeMake(100, 100));
        //        make.centerX.equalTo(self.view.mas_centerX);
        //        make.center.equalTo(self.view.mas_centerY);
        make.center.mas_equalTo(self.view);
    }];
}



- (void)someMethod {
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    // 标准写法
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top .equalTo(self.view.mas_top).multipliedBy(1.0).offset(20);
    //        make.left.equalTo(self.view.mas_left).offset(20);
    //        make.right.equalTo(self.view.mas_right).offset(-20);
    //        make.bottom.equalTo(self.view.mas_bottom).offset(-20);
    //    }];
    
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        make.top .equalTo(self.view).multipliedBy(1.0).offset(20);
    //        make.left.equalTo(self.view).offset(20);
    //        make.right.equalTo(self.view).offset(-20);
    //        make.bottom.equalTo(self.view).offset(-20);
    //    }];
    
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        // 默认是以父控件为基准
    //        make.top.offset(20);
    //        make.left.offset(20);
    //        make.right.offset(-20);
    //        make.bottom.offset(-20);
    //    }];
    
    //    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
    //        // 默认是以父控件为基准
    //        make.top.left.offset(20);
    ////        make.left.offset(20);
    //        make.right.bottom.offset(-20);
    ////        make.bottom.offset(-20);
    //    }];
    
    
//    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
//        
//        //        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(20, 20, 20, 20));
//        make.edges.insets(UIEdgeInsetsMake(20, 20, 20, 20));
//        
//    }];
}



@end
