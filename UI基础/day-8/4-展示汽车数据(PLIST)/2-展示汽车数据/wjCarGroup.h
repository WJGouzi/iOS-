//
//  wjCarGroup.h
//  2-展示汽车数据
//
//  Created by gouzi on 2017/5/2.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "wjCar.h"

@interface wjCarGroup : NSObject

/** header*/
@property (nonatomic, copy) NSString *headerStr;

/** footer*/
@property (nonatomic, copy) NSString *footerStr;

/** car */
@property (nonatomic, strong) NSArray<wjCar *> *carArray;

+ (instancetype)carGroupWithDict:(NSDictionary *)dict;

@end
