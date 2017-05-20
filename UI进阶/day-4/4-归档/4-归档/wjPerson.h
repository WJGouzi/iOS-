//
//  wjPerson.h
//  4-归档
//
//  Created by gouzi on 2017/5/20.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@class wjDog;
@interface wjPerson : NSObject <NSCoding>
/** name*/
@property (nonatomic, copy) NSString *name;
/* age*/
@property (nonatomic, assign) int age;

/** dog */
@property (nonatomic, strong) wjDog *dog;


@end
