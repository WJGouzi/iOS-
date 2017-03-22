//
//  wjCar.m
//  3-scrollView delegate
//
//  Created by gouzi on 2017/3/22.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjCar.h"
#import <UIKit/UIKit.h>

@interface wjCar () 

@end


@implementation wjCar

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%s", __func__);
}


- (void)dealloc {
    NSLog(@"delloc");
}

@end
