//
//  main.m
//  1-kvc
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//


/*
 *  KVC : key value coding (键值编码)
 */



#import <Foundation/Foundation.h>
#import "wjPerson.h"
#import "wjDog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        
    }
    return 0;
}

/**
 *  利用KVC进行取到数组中所有模型的某个属性值
 */
void testGetArrayModelProperties () {
    // 取到数组中所有模型的某个属性值
    wjPerson *person = [[wjPerson alloc] init];
    person.name = @"jun";
    person.age = 22;
    
    wjPerson *man = [[wjPerson alloc] init];
    man.name = @"zouzi";
    man.age = 23;
    
    wjPerson *human = [[wjPerson alloc] init];
    human.name = @"qin";
    human.age = 24;
    
    NSArray *allPersons = @[person , man, human];
    // 取到所有的名称
    NSArray *allPersonName = [allPersons valueForKeyPath:@"name"];
    NSLog(@"names is %@", allPersonName);
}


/**
 *  利用KVC进行取值
 */
void testGetValue () {
    // 取值操作
    wjPerson *person = [[wjPerson alloc] init];
    person.name = @"猴子";
    person.age = 22;
    
    // 利用KVC进行取值
    NSLog(@"name : %@-----age : %d", [person valueForKeyPath:@"name"], [[person valueForKeyPath:@"age"] intValue]);
}

/**
 *  利用KVC进行模型转字典
 */
void testModelToDictionary () {
    // 模型转字典
    wjPerson *person = [[wjPerson alloc] init];
    person.name = @"wang";
    person.age = 21;
    
    //
    NSDictionary *dict = [person dictionaryWithValuesForKeys:@[@"name", @"age"]];
    NSLog(@"dict is %@", dict);
}


/**
 *  利用KVC进行字典转模型
 */
void testDictionaryChangeToModel () {
    /**
     *  在开发中是不建议使用 setValuesForKeysWithDictionary:
     *  1>字典中的key必须在模型的属性中能找到
     *  2>如果模型中带有模型，此种方法就不能使用
     *  应用场景：简单的字典转模型--> 框架 (MJExtention)
     */
    // 利用KVC进行字典转模型
    NSDictionary *dict = @{
                           @"name" : @"wang",
                           @"age" : @26,
                           @"dog" :@{
                                   @"name" : @"旺财",
                                   @"price" : @999.8
                                   },
                           @"books" : @[
                                   @{ @"name" : @"ios" , @"price":@121 },
                                   @{ @"name" : @"ios" , @"price":@121 }
                                   ]
                           };
    wjPerson *person = [[wjPerson alloc] initWithDict:dict];
    NSLog(@"%@", person.dog.class);
}

/**
 *  利用KVC进行修改类的私有成员变量(重点)
 */
void testChangeClassPrivateMemberVariable () {
    // 利用KVC改变类的私有的成员变量
    wjPerson *person = [[wjPerson alloc] init];
    [person printAges];
    [person setValue:@"18" forKeyPath:@"_ages"];
    [person printAges];
}



/**
 *  利用KVC进行综合的赋值
 */
void testForKeyPathAndForKey () {
    wjPerson *person = [[wjPerson alloc] init];
    // 点语法
    person.dog = [[wjDog alloc] init];
    person.dog.name = @"旺财";
    // KVC
    /**
     *  forKey 和 forKeyPath 的区别
     *  1>forKeyPath 包含了所有 forKey 的功能 （所以一般就使用 forKeyPath 就可以了）
     *  2>forKeyPath 可以进行内部的点语法，层层访问内部的属性
     *  3>注意:key值一定要在属性中找到。
     */
//    [person.dog setValue:@"wangwang"  :@"name"];
    [person setValue:@"旺旺" forKeyPath:@"dog.name"];
    
    NSLog(@"%@", person.dog.name);
}


/**
 *  利用KVC进行简单的赋值
 */
void testKvc () {
    wjPerson *person = [[wjPerson alloc] init];
    // 常规赋值
    person.name = @"zhangsan";
    person.age = 13;
    
    // kvc赋值
    [person setValue:@"老王" forKey:@"name"];
    [person setValue:@"19" forKeyPath:@"age"]; // 可以进行自动类型转换
    
    NSLog(@"%@----%d", person.name, person.age);
}
