//
//  wjShopModel.m
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/16.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjShopModel.h"

@implementation wjShopModel

- (instancetype)initWithIcon:(NSString *)icon name:(NSString *)name {
    if (self = [super init]) {
        self.icon = icon;
        self.name = name;
    }
    return self;
}

+ (instancetype)shopWithIcon:(NSString *)icon name:(NSString *)name {
    
    return [[self alloc] initWithIcon:icon name:name];
    
}

- (instancetype)initWithShopDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.icon = dict[@"icon"];
        self.name = dict[@"name"];
    }
    return self;
}

+ (instancetype)shopWithShopDict:(NSDictionary *)dict {
    return [[self alloc] initWithShopDict:dict];
}

@end
