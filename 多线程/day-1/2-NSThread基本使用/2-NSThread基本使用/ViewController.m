//
//  ViewController.m
//  2-NSThread基本使用
//
//  Created by gouzi on 2017/8/6.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self creatMutilThread];
}


- (void)creatNewThreadMethod {
    // 开启一条后台线程
    [self performSelectorInBackground:@selector(run:) withObject:@"开启后台子线程"];
}



- (void)creatDetachNewThreadMethod {
    // 创建分离子线程->会自动启动子线程
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:nil];
}


- (void)creatNewThread {
    
    // 创建线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
    // 启动线程，默认是暂停状态的
    [thread start];
    
}

// 创建多个线程->给每个线程命名以及优先级
- (void)creatMutilThread {
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
    thread1.name = @"thread 1";
    thread1.threadPriority = 0.6; // 设置优先级（0.0~1.0，默认的优先级是0.5）
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
    thread2.name = @"thread 2";
    thread2.threadPriority = 0.3;
    NSThread *thread3 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
    thread3.name = @"thread 3";
    thread3.threadPriority = 1.0;
    [thread1 start];
    [thread2 start];
    [thread3 start];
}



- (void)run:(NSString *)param {
    for (int i = 0; i < 10; i++) {
        NSLog(@"---run--%@", [NSThread currentThread].name);
    }
}


@end
