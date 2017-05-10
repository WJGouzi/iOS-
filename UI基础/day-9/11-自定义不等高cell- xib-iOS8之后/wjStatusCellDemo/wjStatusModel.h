//
//  wjStatusModel.h
//  wjStatusCellDemo
//
//  Created by gouzi on 2017/5/10.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wjStatusModel : NSObject

/** icon*/
@property (nonatomic, copy) NSString *icon;

/** name*/
@property (nonatomic, copy) NSString *name;

/* vip*/
@property (nonatomic, assign, getter=isVip) BOOL vip;

/** text*/
@property (nonatomic, copy) NSString *text;

/** picture*/
@property (nonatomic, copy) NSString *picture;

@end
