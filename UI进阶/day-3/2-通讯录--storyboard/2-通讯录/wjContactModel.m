//
//  wjContactModel.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjContactModel.h"

@implementation wjContactModel

+ (instancetype)modelWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber {
    wjContactModel *model = [[self alloc] init];
    model.name = name;
    model.phoneNumber = phoneNumber;
    return model;
}

@end
