//
//  wjCircleBtn.m
//  1-购物车
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCircleBtn.h"

@implementation wjCircleBtn


- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.layer.borderWidth = 1.f;
    self.layer.borderColor = [UIColor orangeColor].CGColor;
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = CGRectGetWidth(self.frame) * 0.5;
}

@end

