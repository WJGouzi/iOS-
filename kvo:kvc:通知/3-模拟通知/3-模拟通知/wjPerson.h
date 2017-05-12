//
//  wjPerson.h
//  3-模拟通知
//
//  Created by gouzi on 2017/5/12.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjPerson : NSObject

/** name*/
@property (nonatomic, copy) NSString *name;

/** company*/
@property (nonatomic, copy) NSString *company;

- (void)getNews:(NSNotification *)notification;


@end
