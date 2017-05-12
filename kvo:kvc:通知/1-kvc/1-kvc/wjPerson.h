//
//  wjPerson.h
//  1-kvc
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import <Foundation/Foundation.h>
@class wjDog;

@interface wjPerson : NSObject

/** 姓名*/
@property (nonatomic, copy) NSString *name;

/* 年龄*/
@property (nonatomic, assign) int age;

/** dog*/
@property (nonatomic, strong) wjDog *dog;


// 提供方法
- (void)printAges;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)personWithDict:(NSDictionary *)dict;
@end
