//
//  wjShopCarCell.m
//  1-购物车
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjShopCarCell.h"
#import "wjShopCarModel.h"

@interface wjShopCarCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@property (weak, nonatomic) IBOutlet UIButton *addBtn;

@property (weak, nonatomic) IBOutlet UIButton *minusBtn;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;


@end


@implementation wjShopCarCell


/**
 只需要设置一次
 */
- (void)awakeFromNib {
    [super awakeFromNib];
    // 最好不要写在这个地方---在button内部去实现
//    [self setUpCircleBtnWithButton:self.addBtn withColor:[UIColor redColor]];
//    [self setUpCircleBtnWithButton:self.minusBtn withColor:[UIColor orangeColor]];
}


- (void)setUpCircleBtnWithButton:(UIButton *)btn withColor:(UIColor *)customerColor {
    btn.layer.borderWidth = 1.f;
    btn.layer.borderColor = customerColor.CGColor;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = CGRectGetWidth(btn.frame) * 0.5;
}


- (void)setModel:(wjShopCarModel *)model {
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.image];
    self.nameLabel.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.money];
}



@end
