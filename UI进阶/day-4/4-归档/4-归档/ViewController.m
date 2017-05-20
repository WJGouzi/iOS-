//
//  ViewController.m
//  4-归档
//
//  Created by gouzi on 2017/5/20.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjPerson.h"
#import "wjDog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)save:(UIButton *)sender {
    // 创建归档的对象
    wjPerson *person = [[wjPerson alloc] init];
    person.name = @"wangjun";
    person.age = 26;
    
    wjDog *dog = [[wjDog alloc] init];
    dog.name = @"xiaohua";
    person.dog = dog;
    
    
    // 获取沙盒目录
    NSString *path = NSTemporaryDirectory();
    NSLog(@"%@", path);
    // 拼接 -> 拼接的文件名的后缀是随意的，可以防止别人的暴力破解。
    NSString *fullPath = [path stringByAppendingPathComponent:@"person.data"];
    // 归档
    // archiveRootObject会调用encodeWithCoder 方法
    [NSKeyedArchiver archiveRootObject:person toFile:fullPath];
    
}

- (IBAction)read:(UIButton *)sender {
    // 获取沙盒目录
    NSString *path = NSTemporaryDirectory();
    NSString *fullPath = [path stringByAppendingPathComponent:@"person.data"];
    // unarchiveObjectWithFile会调用 initWithCoder方法
    wjPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:fullPath];
    NSLog(@"%@---%d--%@", person.name, person.age, person.dog.name); // 在读取的时候会在wjPerson中去解析沙盒中的文件。然后再返回值回来
}

@end
