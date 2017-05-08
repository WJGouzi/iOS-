//
//  wjShopListModel.h
//  2-自定义等高cell-纯代码
//
//  Created by gouzi on 2017/5/8.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjShopListModel : NSObject


/** icon*/
@property (nonatomic, copy) NSString *icon;

/** title*/
@property (nonatomic, copy) NSString *title;

/** price*/
@property (nonatomic, copy) NSString *price;

/** count*/
@property (nonatomic, copy) NSString *buyCount;


+ (instancetype)shopListWithDict:(NSDictionary *)dict;

@end
