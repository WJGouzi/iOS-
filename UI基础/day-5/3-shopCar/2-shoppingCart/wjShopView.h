//
//  wjShopView.h
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class wjShopModel;

@interface wjShopView : UIView

/** model */
@property (nonatomic, strong) wjShopModel *shopModel;

// 快速构造方法
+ (instancetype)shopView;

@end
