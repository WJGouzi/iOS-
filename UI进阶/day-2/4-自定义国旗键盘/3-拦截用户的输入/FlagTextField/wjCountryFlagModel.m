//
//  wjCountryFlagModel.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCountryFlagModel.h"

@implementation wjCountryFlagModel

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    wjCountryFlagModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}

@end
