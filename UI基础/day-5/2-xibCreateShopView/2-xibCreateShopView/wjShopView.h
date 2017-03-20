//
//  wjShopView.h
//  2-xibCreateShopView
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wjShopView : UIView


// 提供set方法
- (void)setIconImage:(NSString *)imageName;

- (void)setTitleName:(NSString *)titleName;


// 快速构造方法
+ (instancetype)shopView;


@end
