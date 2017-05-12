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

- (void)setModel:(wjShopCarModel *)model {
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.image];
    self.nameLabel.text = model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@",model.money];
    
    // 根据count决定countlabel显示的文字
    self.countLabel.text = [NSString stringWithFormat:@"%d", model.count];
    // 根据countLabel的文字来决定减号按钮能否被点击
    self.minusBtn.enabled = model.count > 0;
    
    
}


- (IBAction)plusShopAction {
    self.model.count ++ ;
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.model.count];
    self.minusBtn.enabled = YES;
    
    if ([self.wjDelegate respondsToSelector:@selector(plusBtnAction:)]) {
        [self.wjDelegate plusBtnAction:self];
    }
}

- (IBAction)minusShopAction {
    self.model.count --;
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.model.count];

    if (self.model.count == 0) {
        self.minusBtn.enabled = NO;
    }
    
    if ([self.wjDelegate respondsToSelector:@selector(minusBtnAction:)]) {
        [self.wjDelegate minusBtnAction:self];
    }
    
}



@end
