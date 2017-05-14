//
//  wjPerson.m
//  1-UIAppliaction
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//  单例  

#import "wjPerson.h"

@implementation wjPerson



// 1.程序一运行就创建对象
// 当类被加载到内存的时候就被调用，早于main函数的调用

static wjPerson *_person;
+ (void)load {
    NSLog(@"%s", __func__);
    _person = [[wjPerson alloc] init];
}


// 2.创建的对象就只有一个
+ (instancetype)sharePerson {
    return _person;
}


// 3.只要调用alloc，程序就抛异常
+ (instancetype)alloc {
    if (_person) {
        NSException *exception = [NSException exceptionWithName:@"NSInternalInconsistencyException" reason:@"这是不能被重复创建的，这是一个单例对象" userInfo:nil];
        [exception raise];
    }
    return [super alloc];
}


@end
