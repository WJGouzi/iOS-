//
//  wjContactModel.h
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjContactModel : NSObject

/** name */
@property (nonatomic, strong) NSString *name;

/** phoneNumber */
@property (nonatomic, strong) NSString *phoneNumber;

+ (instancetype)modelWithName:(NSString *)name phoneNumber:(NSString *)phoneNumber;

@end
