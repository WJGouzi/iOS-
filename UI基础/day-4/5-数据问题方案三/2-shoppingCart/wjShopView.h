//
//  wjShopView.h
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/16.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class wjShopModel;

@interface wjShopView : UIView

//- (void)setShopIcon:(NSString *)icon;
//- (void)setShopName:(NSString *)name;

// 最优方式是传模型过来
/** 模型 */
@property (nonatomic, strong) wjShopModel *model;


// 构造方法
- (instancetype)initWithShopModel:(wjShopModel *)model;
+ (instancetype)shopViewWithShopModel:(wjShopModel *)model;

@end
