//
//  wjShopView.m
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/16.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjShopView.h"

@implementation wjShopView

/** 初始化子控件*/
- (instancetype)init { // 不要设置frame 
    if (self = [super init]) {
        // 获取自身控件的尺寸
//        CGFloat width = self.frame.size.width;
//        CGFloat height = self.frame.size.height;
//        NSLog(@"%f, %f", width, height);
        // 创建商品view视图
        UIView *shopView = [[UIView alloc] init];// WithFrame:CGRectMake(0, 0, width, height)];
        shopView.backgroundColor = [UIColor orangeColor];
        [self addSubview:shopView];
        
        UIImageView *imageView = [[UIImageView alloc] init];
//        imageView.frame = CGRectMake(0, 0, width, width);
        imageView.backgroundColor = [UIColor blueColor];
        [self addSubview:imageView];
        self.iconView = imageView;
        
        
        UILabel *nameLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(0, width, width, height - width)];
        nameLabel.textAlignment = NSTextAlignmentCenter;
        nameLabel.backgroundColor = [UIColor yellowColor];
        [self addSubview:nameLabel];
        self.nameLabel = nameLabel;
    }
    return self;
}


// 布局子控件
- (void)layoutSubviews {
    //  可以拿到frame
    // 一定要调用super
    [super layoutSubviews];
    // 获取自身控件的尺寸
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    //
    self.iconView.frame = CGRectMake(0, 0, width, height);
    self.nameLabel.frame = CGRectMake(0, width, width, height - width);
    

}


@end
