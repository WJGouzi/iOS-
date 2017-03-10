//
//  ViewController.m
//  3-父子控件
//
//  Created by gouzi on 2017/3/10.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;

@property (nonatomic, strong) NSMutableArray *array;

@end

@implementation ViewController

//- (void)loadView {
//    [super loadView];
//    NSLog(@"%s",__func__);
//}


/**
 *  1.系统调用
 *  2.控制器的view加载完毕的时候调用
 *  3.控件的初始化，数据的初始化(懒加载)
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__func__);
    // 耗内存操作
//    [self testMemoryWaring];
    // 1.1查看绿色view的父控件
    NSLog(@"绿色view的父控件:%@---控制器的view:%@", self.greenView.superview, self.view);
    
    
    // 1.2绿色控件的子控件
    NSLog(@"绿色view的子控件:%@",self.greenView.subviews);
    
    
    // 1.3控制器view的子控件
    NSLog(@"%@", self.view.subviews);
    
    // 1.4控制器view的父控件
    NSLog(@"viewDidLoad:======%@", self.view.superview);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear:======%@", self.view.superview);
}


/**
 *  1.系统调用
 *  2.控制器接受到内存警告的时候调用
 *  3.除去一些不必要的内存，去除好时的内存。
 */
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    self.array = nil;
}



/**
 *  模拟内存警告->内存不断增加
 */
- (void)testMemoryWaring {
    NSMutableArray *dataArr = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i< 1000000000; i++) {
        UILabel *label = [[UILabel alloc] init];
        [dataArr addObject:label];
    }
    self.array = dataArr;
}


@end
