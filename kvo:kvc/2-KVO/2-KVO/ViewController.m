//
//  ViewController.m
//  2-KVO
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

/*
 *  KVO : Key Value Observing (键值监听)
 *      当某个对象的属性发生改变的时候用KVO监听
 */



#import "ViewController.h"
#import "wjPerson.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    wjPerson *person = [[wjPerson alloc] init];
    person.name = @"zs";
    
    // 监听属性的变化
    /*
     *  作用:给对象绑定一个监听器(观察者)
     *    -observer 观察者
     *    -keyPath 要监听的属性
     *    -options 选项(方法中拿到属性值)
     */
    [person addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew |NSKeyValueObservingOptionOld context:nil];
    
    person.name = @"ls";
    
    person.name = @"haha";
    
    // 移除监听
    [person removeObserver:self forKeyPath:@"name"];
}


/**
 当监听的属性值发生改变

 @param keyPath 要改变的属性
 @param object 要改变属性所属的对象
 @param change 改变的内容
 @param context 上下文
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@--%@--%@", keyPath, object, change);
    
}


@end
