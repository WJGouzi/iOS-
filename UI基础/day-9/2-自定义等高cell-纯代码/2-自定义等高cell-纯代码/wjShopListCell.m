//
//  wjShopListCell.m
//  2-自定义等高cell-纯代码
//
//  Created by gouzi on 2017/5/8.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjShopListCell.h"
#import "wjShopListModel.h"

@interface wjShopListCell ()


/** 图片*/
@property (nonatomic, strong) UIImageView *headImageView;

/** title*/
@property (nonatomic, strong) UILabel *titleLabel;

/** price*/
@property (nonatomic, strong) UILabel *priceLabel;

/** count*/
@property (nonatomic, strong) UILabel *countLabel;

@end


@implementation wjShopListCell


/**
 重写方法
 */
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 图标
        self.headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headImageView]; // 注意的是要添加到contentView中
        
        // title
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
        
        
        // price
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.textColor = [UIColor orangeColor];
        self.priceLabel.textAlignment = NSTextAlignmentLeft;
        self.priceLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.priceLabel];
        
        // count
        self.countLabel = [[UILabel alloc] init];
        self.countLabel.textColor = [UIColor lightGrayColor];
        self.countLabel.textAlignment = NSTextAlignmentRight;
        self.countLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.countLabel];
        
    }
    return self;
}


// 重新布局子控件的位置和尺寸
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat margin = 10;
    CGFloat contentViewWidth = CGRectGetWidth(self.contentView.frame);
    CGFloat contentViewHeight = CGRectGetHeight(self.contentView.frame);
    // 图标
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconWidth = 80;
    CGFloat iconHeight = contentViewHeight - 2 * margin;
    self.headImageView.frame = CGRectMake(iconX, iconY, iconWidth, iconHeight);
    self.headImageView.backgroundColor = [UIColor yellowColor];
    
    // title
    CGFloat titleX = CGRectGetMaxX(self.headImageView.frame) + margin;
    CGFloat titleY = iconY;
    CGFloat titleWidth = contentViewWidth - titleX - margin;
    CGFloat titleHeight = 20;
    self.titleLabel.frame = CGRectMake(titleX, titleY, titleWidth, titleHeight);
    
    // price
    CGFloat priceWidth = 100;
    CGFloat priceHeight = 20;
    CGFloat priceX = titleX;
    CGFloat priceY = iconY + iconHeight - priceHeight ;
    self.priceLabel.frame = CGRectMake(priceX, priceY, priceWidth, priceHeight);
    
    // count
    CGFloat countWidth = 100;
    CGFloat countHeight = priceHeight;
    CGFloat countX = contentViewWidth - countWidth - margin;
    CGFloat countY = iconY + iconHeight - countHeight;
    self.countLabel.frame = CGRectMake(countX, countY, countWidth, countHeight);
    
}



/** 重写setter方法，重置数据源*/
- (void)setModel:(wjShopListModel *)model {
    _model = model;
    self.headImageView.image = [UIImage imageNamed:model.icon];
    self.titleLabel.text = model.title;
    self.priceLabel.text = [NSString stringWithFormat:@"￥%@", model.price];
    self.countLabel.text = [NSString stringWithFormat:@"%@人购买", model.buyCount];
    
}










@end
