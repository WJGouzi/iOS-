//
//  wjCountryFlagModel.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCountryFlagModel.h"

@implementation wjCountryFlagModel

/** KVC的底层实现
 [model setValue:@"中国" forKeyPath:@"name"];
 setValue:forKeyPath实现原理
 1.先查看有没有对应key值的set方法,如果有set方法,就会调用set方法,给对应的属性赋值
 2.如果没有set方法,去查看有没有跟key值相同并且带有下划线的成员属性.如果有的话,就给带有下划线的成员属性赋值
 3.如果没有跟key值相同并且带有下划线的成员属性,还会去找有没有跟key值相同名称的成员属性.如果有,就给它赋值.
 4.如果没有直接报错.
 */

+ (instancetype)modelWithDict:(NSDictionary *)dict {
    wjCountryFlagModel *model = [[self alloc] init];
//    [model setValuesForKeysWithDictionary:dict]; // 如果用KVC方法进行赋值的话，必须要求 model和plist的字段名是一致的
    // 这里进行遍历的时候，icon的类型和plist的类型不一致。所以就要重写icon的set方法
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [model setValue:obj forKey:key];
    }];

    return model;
}

// 由于传进来的是NSString类型的数据，所以在KVC设置数据的时候
// 会重新调用set方法，在这个地方就对icon进行重新设置
- (void)setIcon:(NSString *)icon {
    _icon = [UIImage imageNamed:icon];
}


@end
