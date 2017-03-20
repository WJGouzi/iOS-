//
//  wjShopView.m
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjShopView.h"
#import "wjShopModel.h"

@interface wjShopView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *shopNameLabel;

@end


@implementation wjShopView

+ (instancetype)shopView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

- (void)setShopModel:(wjShopModel *)shopModel {
    _shopModel = shopModel;
    // 设置子控件的数据
    self.iconView.image = [UIImage imageNamed:shopModel.icon];
    self.shopNameLabel.text = shopModel.name;
}


@end
