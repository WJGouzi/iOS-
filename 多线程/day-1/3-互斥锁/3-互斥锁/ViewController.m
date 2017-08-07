//
//  ViewController.m
//  3-互斥锁
//
//  Created by gouzi on 2017/8/6.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 售票员
@property (nonatomic, strong) NSThread *threadA;
@property (nonatomic, strong) NSThread *threadB;
@property (nonatomic, strong) NSThread *threadC;

/* 总票数*/
@property (nonatomic, assign) NSInteger totalCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.totalCount = 100;
    self.threadA = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadB = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadC = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.threadA.name = @"售票员A";
    self.threadB.name = @"售票员B";
    self.threadC.name = @"售票员C";
    [self.threadA start];
    [self.threadB start];
    [self.threadC start];
}


- (void)saleTicket {
    while (1) {
        // 锁必须是全局唯一的。
        // 1.注意点，不能随便能乱加，加锁的位置要注意
        // 2.加锁的前提条件，--多线程共享同一个资源
        // 3.注意加锁是需要代价的--需要耗费性能的
        // 4.加锁的结果是造成线程同步。
        @synchronized (self) {
            NSInteger count = self.totalCount;
            if (count > 0) {
                self.totalCount = count - 1;
                // 卖出去一张票，还剩下多少张
                NSLog(@"%@卖出去一张票, 还剩下%ld张", [NSThread currentThread].name, self.totalCount);
            } else {
                NSLog(@"没票了");
                break;
            }
        }
    }
    
}


@end
