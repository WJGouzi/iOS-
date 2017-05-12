//
//  wjPerson.m
//  3-模拟通知
//
//  Created by gouzi on 2017/5/12.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjPerson.h"

@implementation wjPerson

- (void)getNews:(NSNotification *)notification {
    NSLog(@"获取新闻");
    NSLog(@"%@接收到%@公司的%@，新闻内容是[%@]", self.name, [notification.object name], notification.name, notification.userInfo);
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self]; // 移除本身的通知
}


@end
