//
//  wjCar.h
//  2-展示汽车数据
//
//  Created by gouzi on 2017/5/2.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjCar : NSObject
/** name*/
@property (nonatomic, copy) NSString *name;
/** icon*/
@property (nonatomic, copy) NSString *icon;

+ (instancetype)carWithName:(NSString *)name icon:(NSString *)icon;
@end
