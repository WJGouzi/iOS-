//
//  wjProvinceModel.h
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/15.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjProvinceModel : NSObject

/** province*/
@property (nonatomic, strong) NSString *name;

/** cityArray*/
@property (nonatomic, strong) NSArray *cities;


+ (instancetype)provinceWithDict:(NSDictionary *)dict;


@end
