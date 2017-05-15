//
//  wjCountryFlagModel.h
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wjCountryFlagModel : NSObject

/** name*/
@property (nonatomic, strong) NSString *name;

/** icon*/
@property (nonatomic, strong) UIImage *icon;

+ (instancetype)modelWithDict:(NSDictionary *)dict;

@end
