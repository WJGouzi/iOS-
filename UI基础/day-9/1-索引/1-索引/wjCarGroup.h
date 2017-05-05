//
//  wjCarGroup.h
//  1-索引
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "wjCar.h"

@interface wjCarGroup : NSObject

/** cars catagory*/
@property (nonatomic, copy) NSString *title;

/** car arrar*/
@property (nonatomic, strong) NSArray<wjCar *> *cars;


+ (instancetype)carGroupWithDict:(NSDictionary *)dict;

@end
