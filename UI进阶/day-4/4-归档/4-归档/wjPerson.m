//
//  wjPerson.m
//  4-归档
//
//  Created by gouzi on 2017/5/20.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjPerson.h"


@implementation wjPerson


// 归档
/**
 * 在保存对象之前就要告诉保存当前对象的那些属性

 */
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeInt:self.age forKey:@"age"];
    [aCoder encodeObject:self.dog forKey:@"dog"];
}


// 解归档

/**
 当要解析一个文件的时候进行调用
 告诉当前要解析文件中的那些属性
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.age = [aDecoder decodeIntForKey:@"age"];
        self.dog = [aDecoder decodeObjectForKey:@"dog"];
    }
    return self;
}





@end
