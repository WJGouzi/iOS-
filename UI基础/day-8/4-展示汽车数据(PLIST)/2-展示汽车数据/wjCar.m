//
//  wjCar.m
//  2-展示汽车数据
//
//  Created by gouzi on 2017/5/2.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCar.h"

@implementation wjCar

+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon {
    wjCar *car = [[self alloc] init];
    car.name = name;
    car.icon = icon;
    return car;
}


+ (instancetype)carWithDict:(NSDictionary *)dict {
    wjCar *car = [[self alloc] init];
    car.name = dict[@"name"];
    car.icon = dict[@"icon"];
    return car;
}


@end
