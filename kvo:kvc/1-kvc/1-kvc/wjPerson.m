//
//  wjPerson.m
//  1-kvc
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjPerson.h"

@implementation wjPerson {
    int _ages;
}

- (instancetype)init {
    if (self = [super init]) {
        _ages = 20;
    }
    return self;
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        // 常规的进行赋值
        /*
        self.name = dict[@"name"];
        self.age = [dict[@"age"] intValue];
        */
        // 利用KVC进行赋值
        [self setValuesForKeysWithDictionary:dict];
        
        
    }
    return self;
}

+ (instancetype)personWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

- (NSString *)description {
    return [NSString stringWithFormat:@"name: %@---age: %d", _name, _age];
}

- (void)printAges {
    NSLog(@"ages is %d", _ages);
}



@end
