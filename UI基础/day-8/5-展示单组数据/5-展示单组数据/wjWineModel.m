//
//  wjWineModel.m
//  5-展示单组数据
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjWineModel.h"

@implementation wjWineModel

+ (instancetype)wineWithDict:(NSDictionary *)dict {
    wjWineModel *wineModel = [[self alloc] init];
    wineModel.name = dict[@"name"];
    wineModel.price = dict[@"money"];
    wineModel.icon = dict[@"image"];
    return wineModel;
}

@end

