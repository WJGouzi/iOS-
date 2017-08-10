//
//  ViewController.m
//  5-GCD基本使用
//
//  Created by gouzi on 2017/8/7.
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
    [self wjGetGlobleConcurrentQueue];
//    [self wjSyncSerial];
//    [self wjSyncConcurrent];
//    [self wjAsyncSerial];
//    [self wjAsyncConcurrent];
}


/**
 获得全局并发队列
 */
- (void)wjGetGlobleConcurrentQueue {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 1 : %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 2 : %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 3 : %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 4 : %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 5 : %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 6 : %@", [NSThread currentThread]);
    });
    /*
     打印结果->可以显示出，并不是有多少个任务就创建多少个线程，而是有系统自己决定的。
     异步+并发 3 : <NSThread: 0x60000026c700>{number = 5, name = (null)}
     异步+并发 4 : <NSThread: 0x6080002688c0>{number = 6, name = (null)}
     异步+并发 1 : <NSThread: 0x608000268c80>{number = 3, name = (null)}
     异步+并发 2 : <NSThread: 0x608000268a80>{number = 4, name = (null)}
     异步+并发 5 : <NSThread: 0x60000026c3c0>{number = 7, name = (null)}
     异步+并发 6 : <NSThread: 0x60000026c700>{number = 5, name = (null)}
     */
    
}



/**
 同步+串行->不会开线程
 */
- (void)wjSyncSerial {
    dispatch_queue_t queue = dispatch_queue_create("com.wj.download", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        NSLog(@"同步+串行 1 : %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"同步+串行 2 : %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"同步+串行 3 : %@", [NSThread currentThread]);
    });
    /*
     打印结果
     同步+串行 1 : <NSThread: 0x600000077180>{number = 1, name = main}
     同步+串行 2 : <NSThread: 0x600000077180>{number = 1, name = main}
     同步+串行 3 : <NSThread: 0x600000077180>{number = 1, name = main}
     */
}


/**
 同步+并发->不会开线程，在主线程中执行，且任务是串行执行
 */
- (void)wjSyncConcurrent {
    dispatch_queue_t queue = dispatch_queue_create("com.wj.downLoad", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        NSLog(@"同步+并发 1 : %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"同步+并发 2 : %@", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"同步+并发 3 : %@", [NSThread currentThread]);
    });
    /*
     打印结果
     同步+并发 1 : <NSThread: 0x608000261f80>{number = 1, name = main}
     同步+并发 2 : <NSThread: 0x608000261f80>{number = 1, name = main} 
     同步+并发 3 : <NSThread: 0x608000261f80>{number = 1, name = main}
     */
}



/**
 异步+串行->会开线程，开了一条线程，队列中的任务是串行执行的。
 */
- (void)wjAsyncSerial {
    dispatch_queue_t queue = dispatch_queue_create("com.wj.download", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"异步+串行 1 : %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"异步+串行 2 : %@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"异步+串行 3 : %@", [NSThread currentThread]);
    });
    /*
     打印结果
     异步+串行 1 : <NSThread: 0x60800006dd80>{number = 3, name = (null)}
     异步+串行 2 : <NSThread: 0x60800006dd80>{number = 3, name = (null)}
     异步+串行 3 : <NSThread: 0x60800006dd80>{number = 3, name = (null)}
     */
}



/**
 异步+并发->会开启多条线程的，队列中任务是异步执行的
 */
- (void)wjAsyncConcurrent {
    // 1.创建队列
    // DISPATCH_QUEUE_CONCURRENT : 并发队列
    dispatch_queue_t queue = dispatch_queue_create("com.wj.downLoad", DISPATCH_QUEUE_CONCURRENT);
    // 2.定制任务->还将把任务添加到队列中
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 1 : %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 2 : %@", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"异步+并发 3 : %@", [NSThread currentThread]);
    });
    /*
     打印结果
     异步+并发 1 : <NSThread: 0x600000070480>{number = 3, name = (null)}
     异步+并发 3 : <NSThread: 0x600000070840>{number = 4, name = (null)}
     异步+并发 2 : <NSThread: 0x600000070680>{number = 5, name = (null)}
     */
}

@end
