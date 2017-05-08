//
//  wjShopCell.m
//  6-自定义等高cell-xib
//
//  Created by gouzi on 2017/5/8.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjShopCell.h"
#import "wjShopListModel.h"

@interface wjShopCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconIamgeView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation wjShopCell

- (void)setModel:(wjShopListModel *)model {
    _model = model;
    self.iconIamgeView.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text = model.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", model.price];
    self.countLabel.text = [NSString stringWithFormat:@"%@人购买", model.buyCount];
}

@end
