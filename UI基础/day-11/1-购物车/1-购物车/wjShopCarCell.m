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

//
///**
// 只需要设置一次
// */
//- (void)awakeFromNib {
//    [super awakeFromNib];
//    // 最好不要写在这个地方---在button内部去实现
////    [self setUpCircleBtnWithButton:self.addBtn withColor:[UIColor redColor]];
////    [self setUpCircleBtnWithButton:self.minusBtn withColor:[UIColor orangeColor]];
//}
//
//
//- (void)setUpCircleBtnWithButton:(UIButton *)btn withColor:(UIColor *)customerColor {
//    btn.layer.borderWidth = 1.f;
//    btn.layer.borderColor = customerColor.CGColor;
//    btn.layer.masksToBounds = YES;
//    btn.layer.cornerRadius = CGRectGetWidth(btn.frame) * 0.5;
//}


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
    // 主动重新传递模型，主动刷新tableView。这样做会把cell的整个数据全部重新加载，但是只需要修改counLabel的文字
//    [self setModel:self.model];
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.model.count];
    self.minusBtn.enabled = YES;
    
    // 发布通知
    
}

- (IBAction)minusShopAction {
    self.model.count --;
    self.countLabel.text = [NSString stringWithFormat:@"%d", self.model.count];

    if (self.model.count == 0) {
        self.minusBtn.enabled = NO;
        return;
    }
    
    // 发布通知
    
    
}



@end
