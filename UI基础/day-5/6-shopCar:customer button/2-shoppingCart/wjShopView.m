//
//  wjShopView.m
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjShopView.h"
#import "wjShopModel.h"

@implementation wjShopView


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 文本居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        // 文字颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    // 获取自身的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;

    // 调整子控件的位置
    self.imageView.frame = CGRectMake(0, 0, width, width);
    self.titleLabel.frame = CGRectMake(0, width, width, height - width);
}




- (void)setShopModel:(wjShopModel *)shopModel {
    _shopModel = shopModel;
    /*
     此方法不能设置图片和名字
    self.imageView.image = [UIImage imageNamed:shopModel.icon];
    self.titleLabel.text = shopModel.name;
     */
    [self setImage:[UIImage imageNamed:shopModel.icon] forState:UIControlStateNormal];
    [self setTitle:shopModel.name forState:UIControlStateNormal];
}

@end
