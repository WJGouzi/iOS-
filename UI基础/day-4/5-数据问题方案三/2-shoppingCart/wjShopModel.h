//
//  wjShopModel.h
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/16.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjShopModel : NSObject

/** 图片的名称*/
@property (nonatomic, copy) NSString *icon;

/** 商品的名称*/
@property (nonatomic, copy) NSString *name;

/** 提供对象方法*/
- (instancetype)initWithIcon:(NSString *)icon name:(NSString *)name;

+ (instancetype)shopWithIcon:(NSString *)icon name:(NSString *)name;

// 最优方式
- (instancetype)initWithShopDict:(NSDictionary *)dict;

+ (instancetype)shopWithShopDict:(NSDictionary *)dict;


@end
