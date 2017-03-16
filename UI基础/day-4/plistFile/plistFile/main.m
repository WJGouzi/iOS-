//
//  main.m
//  plistFile
//
//  Created by gouzi on 2017/3/16.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 数组
        /*
         NSArray *names = @[@"yjh", @"gxq", @"mj", @"nj"];
         BOOL flag = [names writeToFile:@"/Users/xiaomage/Desktop/names.plist" atomically:YES];
         */
        /*
         NSDictionary *persons = @{
         @"name" : @"yjh",
         @"age" : @18,
         @"height" : @1.88
         };
         BOOL flag = [persons writeToFile:@"/Users/xiaomage/Desktop/person.plist" atomically:YES];
         */
        /*
         NSArray *persons = @[
                              @{@"name" : @"mj", @"age":@38},
                              @{@"name" : @"yjh", @"age":@25, @"friends":@[@"大神11期", @"sz"]}
                              ];
         BOOL flag = [persons writeToFile:@"/Users/wangjun/Desktop/persons.plist" atomically:YES];
         if (flag) {
         NSLog(@"写入成功!");
         }
        */
        NSArray *dataArr = @[
                             @{@"name":@"单肩包", @"icon":@"danjianbao"},
                             @{@"name":@"钱包", @"icon":@"qianbao"},
                             @{@"name":@"链条包", @"icon":@"liantiaobao"},
                             @{@"name":@"手提包", @"icon":@"shoutibao"},
                             @{@"name":@"双肩包", @"icon":@"shuangjianbao"},
                             @{@"name":@"斜挎包", @"icon":@"xiekuabao"}
                             ];
        BOOL flag = [dataArr writeToFile:@"/Users/wangjun/Desktop/shopData.plist" atomically:YES];
        if (flag) {
            NSLog(@"写入成功!");
        }
        
        // 加载plist文件
//        NSArray *persons = [NSArray arrayWithContentsOfFile:@"/Users/wangjun/Desktop/data.plist"];
//        NSLog(@"%@", persons);
    }
    return 0;
}
