//
//  ViewController.m
//  1-UIAppliaction
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 内存地址是一样的
    UIApplication *app = [UIApplication sharedApplication];
    UIApplication *app1 = [UIApplication sharedApplication];
    NSLog(@"%p---- %p", app, app1);

    wjPerson *person = [wjPerson sharePerson];
    wjPerson *person1 = [wjPerson sharePerson];
    NSLog(@"person = %p------person1 = %p", person, person1);
    
    wjPerson *person2 = [[wjPerson alloc] init];
    
}


@end
