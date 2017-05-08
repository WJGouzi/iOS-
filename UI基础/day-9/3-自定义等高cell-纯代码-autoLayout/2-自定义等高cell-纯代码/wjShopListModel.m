//
//  wjShopListModel.m
//  2-自定义等高cell-纯代码
//
//  Created by gouzi on 2017/5/8.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjShopListModel.h"

@implementation wjShopListModel

+ (instancetype)shopListWithDict:(NSDictionary *)dict {
    wjShopListModel *modle = [[self alloc] init];
    // kvc直接赋值
    [modle setValuesForKeysWithDictionary:dict];
    return modle;
}

@end
