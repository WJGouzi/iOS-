//
//  wjWineModel.h
//  5-展示单组数据
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjWineModel : NSObject

/** name*/
@property (nonatomic, copy) NSString *name;

/** price*/
@property (nonatomic, copy) NSString *price;

/** icon*/
@property (nonatomic, copy) NSString *icon;

+ (instancetype)wineWithDict:(NSDictionary *)dict;

@end
