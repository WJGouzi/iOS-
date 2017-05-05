//
//  wjCarGroup.m
//  2-展示汽车数据
//
//  Created by gouzi on 2017/5/2.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCarGroup.h"
#import "wjCar.h"

@implementation wjCarGroup

+ (instancetype)carGroupWithDict:(NSDictionary *)dict {
    wjCarGroup *carGroup = [[self alloc] init];
//    [carGroup setValuesForKeysWithDictionary:dict];
    carGroup.headerStr = dict[@"header"];
    carGroup.footerStr = dict[@"footer"];
//    carGroup.carArray = dict[@"cars"];
    NSMutableArray *tempCarArray = [NSMutableArray array];
    for (NSDictionary *carDict in dict[@"cars"]) {
        wjCar *car = [wjCar carWithDict:carDict];
        [tempCarArray addObject:car];
    }
    carGroup.carArray = [tempCarArray copy];
    return carGroup;
}

@end
