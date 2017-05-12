//
//  wjShopCarModel.h
//  1-购物车
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjShopCarModel : NSObject

/** image*/
@property (nonatomic, copy) NSString *image;

/** price*/
@property (nonatomic, copy) NSString *money;

/** name*/
@property (nonatomic, copy) NSString *name;


/* count*/
@property (nonatomic, assign) int count;


@end
