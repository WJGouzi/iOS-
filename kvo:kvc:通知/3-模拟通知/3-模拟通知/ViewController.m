//
//  ViewController.m
//  3-模拟通知
//
//  Created by gouzi on 2017/5/12.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjPerson.h"
#import "wjCompany.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    wjCompany *tencent = [[wjCompany alloc] init];
    tencent.name = @"tencent";
    
    wjCompany *sina = [[wjCompany alloc] init];
    sina.name = @"sina";
    
    wjPerson *p1 = [[wjPerson alloc] init];
    p1.name = @"张三";
    
    wjPerson *p2 = [[wjPerson alloc] init];
    p2.name = @"李四";
    
    wjPerson *p3 = [[wjPerson alloc] init];
    p3.name = @"王五";
    
    /**********模拟通知**************/
    // 监听
    [[NSNotificationCenter defaultCenter] addObserver:p1 selector:@selector(getNews:) name:@"军事新闻" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:p2 selector:@selector(getNews:) name:@"娱乐新闻" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:p3 selector:@selector(getNews:) name:nil object:nil];


    // 发布通知
    NSNotification *notification = [NSNotification notificationWithName:@"军事新闻" object:tencent userInfo:@{@"title" : @"竟然是这样的"}];
    
    [[NSNotificationCenter defaultCenter] postNotification:notification];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"娱乐新闻" object:tencent userInfo:@{@"title" : @"messi"}];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"军事新闻" object:sina userInfo:@{@"title" : @"mmp"}];
    // 匿名通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"sex新闻" object:nil userInfo:@{@"title": @"XXXXXXXXYYYYYY"}];

    
    // 最好在推出当前控制器的时候需要移除通知-------有监听就有移除
    // 移除通知
    [[NSNotificationCenter defaultCenter] removeObserver:p3 name:@"sex新闻" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:p3]; // p3的所有通知不会再去监听
}


- (void)dealloc {
    
}






@end
