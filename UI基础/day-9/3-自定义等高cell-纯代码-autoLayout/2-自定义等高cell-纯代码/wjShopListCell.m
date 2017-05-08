//
//  wjShopListCell.m
//  2-自定义等高cell-纯代码
//
//  Created by gouzi on 2017/5/8.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjShopListCell.h"
#import "wjShopListModel.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"


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


/** 重写方法 */
// 这里需要进行设置约束
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat margin = 10;
        // 图标
        self.headImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.headImageView]; // 注意的是要添加到contentView中
        [self.headImageView makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(margin);
            make.bottom.equalTo(self.contentView).offset(-margin);
            make.width.equalTo(80);
        }];
        // title
        self.titleLabel = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLabel];
        [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.headImageView.top);
            make.left.equalTo(self.headImageView.right).offset(margin);
            make.right.equalTo(self.contentView).offset(-margin);
            make.height.equalTo(20);
        }];
        
        // price
        self.priceLabel = [[UILabel alloc] init];
        self.priceLabel.textColor = [UIColor orangeColor];
        self.priceLabel.textAlignment = NSTextAlignmentLeft;
        self.priceLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.priceLabel];
        [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.left);
            make.bottom.equalTo(self.headImageView.bottom);
            make.size.equalTo(CGSizeMake(100, 15));
        }];
        
        // count
        self.countLabel = [[UILabel alloc] init];
        self.countLabel.textColor = [UIColor lightGrayColor];
        self.countLabel.textAlignment = NSTextAlignmentRight;
        self.countLabel.font = [UIFont systemFontOfSize:15.0f];
        [self.contentView addSubview:self.countLabel];
        [self.countLabel makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.headImageView.bottom);
            make.right.equalTo(self.titleLabel.right);
            make.size.equalTo(CGSizeMake(150, 14));
            
        }];
    }
    return self;
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
