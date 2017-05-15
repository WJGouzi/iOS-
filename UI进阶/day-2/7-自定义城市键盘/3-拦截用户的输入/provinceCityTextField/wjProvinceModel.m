//
//  wjProvinceModel.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/15.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjProvinceModel.h"

@implementation wjProvinceModel

+ (instancetype)provinceWithDict:(NSDictionary *)dict {
    wjProvinceModel *model = [[self alloc] init];
    [model setValuesForKeysWithDictionary:dict];
    return model;
}


@end
