//
//  wjCountryFlagView.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCountryFlagView.h"
#import "wjCountryFlagModel.h"

@interface wjCountryFlagView ()

@property (weak, nonatomic) IBOutlet UILabel *wjCountryNameLabel;

@property (weak, nonatomic) IBOutlet UIImageView *wjFlagImageView;

@end


@implementation wjCountryFlagView

+ (instancetype)countryFlagView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([wjCountryFlagView class]) owner:nil options:nil].lastObject;
}


// 这里设置图片的时候就直接使用的是UIImage类型，而不是NSString类型
- (void)setModel:(wjCountryFlagModel *)model {
    _model = model;
    self.wjCountryNameLabel.text = model.name;
    self.wjFlagImageView.image = model.icon;
}


@end
