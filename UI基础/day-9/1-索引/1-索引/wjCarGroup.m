//
//  wjCarGroup.m
//  1-索引
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCarGroup.h"

@implementation wjCarGroup

+ (instancetype)carGroupWithDict:(NSDictionary *)dict {
    wjCarGroup *carGroup = [[self alloc] init];
    carGroup.title = dict[@"title"];
    
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSDictionary *dic in dict[@"cars"]) {
        wjCar *car = [wjCar carWithDict:dic];
        [tempArray addObject:car];
    }
    carGroup.cars = [tempArray copy];
    return carGroup;
}

@end
