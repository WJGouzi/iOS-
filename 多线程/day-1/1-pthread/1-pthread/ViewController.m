//
//  ViewController.m
//  1-pthread
//
//  Created by gouzi on 2017/8/6.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btnClickAction:(id)sender {
    // 创建线程对象
    pthread_t thread;
    
    // 创建线程
    
    /**
     创建线程

     @param _Nonnull#> 线程对象传递地址 description#>
     @param _Nullable#> 线程的属性（优先级等） description#>
     @param _Nonnull 指向函数的指针
     @return 函数需要传递的函数
     */
    pthread_create(&thread, nil, task, NULL); // 创建一条线程，如果要创建多个线程就可以将上面的代码copy下就可以了。
 
    pthread_t threadB;
    pthread_create(&threadB, nil, task, NULL); // 第二个线程
    
    pthread_equal(thread, threadB); // 判断两个线程是不是相等。
}


void * task(void *parameter) {
    NSLog(@"%@ ---- ", [NSThread currentThread]);
    return NULL;
}


@end
