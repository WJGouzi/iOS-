//
//  wjCar.m
//  1-索引
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCar.h"

@implementation wjCar

+ (instancetype)carWithDict:(NSDictionary *)dict {
    wjCar *car = [[self alloc] init];
    car.name = dict[@"name"];
    car.icon = dict[@"icon"];
    return car;
}

@end
