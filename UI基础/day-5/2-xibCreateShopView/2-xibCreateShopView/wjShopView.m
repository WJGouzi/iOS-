//
//  wjShopView.m
//  2-xibCreateShopView
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjShopView.h"

@interface wjShopView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;
@end

@implementation wjShopView

- (void)setIconImage:(NSString *)imageName {
    self.iconView.image = [UIImage imageNamed:imageName];
}

- (void)setTitleNameLabel:(NSString *)titleName {
    self.titleNameLabel.text = titleName;
}

@end
