//
//  wjShopView.m
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/16.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjShopView.h"
#import "wjShopModel.h"

@interface wjShopView ()

@property (nonatomic, weak) UIImageView *iconView;

@property (nonatomic, weak) UILabel *nameLabel;

@end


@implementation wjShopView

/** 初始化子控件*/
- (instancetype)init { // 不要设置frame 
    if (self = [super init]) {
        [self settings];
    }
    return self;
}

// 如果重写了此方法，就可以不用写 - init 的方法，因为init方法和initWithFrame:方法都会调用initWithFrame:方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self settings];
    }
    return self;
}


/**
 *  构造方法
 */
- (instancetype)initWithShopModel:(wjShopModel *)model {
    if (self = [super init]) {
        [self settings];
        self.model = model;
    }
    return self;
}

+ (instancetype)shopViewWithShopModel:(wjShopModel *)model {
    return [[self alloc] initWithShopModel:model];
}


- (void)settings {
    // 创建商品view视图
    UIView *shopView = [[UIView alloc] init];
    shopView.backgroundColor = [UIColor orangeColor];
    [self addSubview:shopView];
    
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor blueColor];
    [self addSubview:imageView];
    self.iconView = imageView;
    
    
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.backgroundColor = [UIColor yellowColor];
    [self addSubview:nameLabel];
    self.nameLabel = nameLabel;
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


//- (void)setShopName:(NSString *)name {
//    self.nameLabel.text = name;
//}
//
//- (void)setShopIcon:(NSString *)icon {
//    self.iconView.image = [UIImage imageNamed:icon];
//
//}

// setter方法
/**
 *  只要外面传数据就会调用
 *  作用:设置数据
 */
- (void)setModel:(wjShopModel *)model {
    _model= model;
    // 设置数据
    self.iconView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.name;
    
}
















@end
