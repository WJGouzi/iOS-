//
//  wjStatusModel.h
//  9-自定义不等高cell-代码
//
//  Created by gouzi on 2017/5/9.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wjStatusModel : NSObject

/** icon*/
@property (nonatomic, copy) NSString *icon;

/** nickName*/
@property (nonatomic, copy) NSString *name;

/** text*/
@property (nonatomic, copy) NSString *text;

/* VIP*/
@property (nonatomic, assign, getter=isVip) BOOL vip;

/** pic*/
@property (nonatomic, copy) NSString *picture;


@end
