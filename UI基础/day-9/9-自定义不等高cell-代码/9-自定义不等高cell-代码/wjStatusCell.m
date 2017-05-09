//
//  wjStatusCell.m
//  9-自定义不等高cell-代码
//
//  Created by gouzi on 2017/5/9.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjStatusCell.h"
#import "wjStatusModel.h"

@interface wjStatusCell ()

@property (nonatomic, strong) UIImageView *iconImageView;

/** nickName */
@property (nonatomic, strong) UILabel *nickNameLabel;

/** vip */
@property (nonatomic, strong) UIImageView *vipImageView;

/** text */
@property (nonatomic, strong) UILabel *mainTextLabel;

/** img */
@property (nonatomic, strong) UIImageView *pictureImageView;


@end

@implementation wjStatusCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /** 图像 */
        UIImageView *iconImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconImageView];
        self.iconImageView = iconImageView;
        
        /** 配图 */
        UIImageView *pictureImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:pictureImageView];
        self.pictureImageView = pictureImageView;
        
        /** vip */
        UIImageView *vipImageView = [[UIImageView alloc] init];
        vipImageView.image = [UIImage imageNamed:@"vip"];
        [self.contentView addSubview:vipImageView];
        self.vipImageView = vipImageView;
        
        /** 昵称 */
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.font = [UIFont systemFontOfSize:17.0f];
        [self.contentView addSubview:nameLabel];
        self.nickNameLabel = nameLabel;
        
        /** 正文 */
        UILabel *text_Label = [[UILabel alloc] init];
        text_Label.font = [UIFont systemFontOfSize:14.0f];
        text_Label.numberOfLines = 0;
        [self.contentView addSubview:text_Label];
        self.mainTextLabel = text_Label;
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat margin = 10;
    CGFloat iconX = margin;
    CGFloat iconY = margin;
    CGFloat iconWH = 30;
    self.iconImageView.frame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    // 不需要换行
    CGFloat nickNameX = CGRectGetMaxX(self.iconImageView.frame) + margin;
    CGFloat nickNameY = iconY;
    NSDictionary *attrDict = @{NSFontAttributeName : [UIFont systemFontOfSize:17.0f]};
    CGSize nickNameSize = [self.model.name sizeWithAttributes:attrDict];
    CGFloat nickNameH = nickNameSize.height;
    CGFloat nickNameW = nickNameSize.width;
    self.nickNameLabel.frame = CGRectMake(nickNameX, nickNameY, nickNameW, nickNameH);
    
    
    if (self.model.isVip) {
        CGFloat vipX = CGRectGetMaxX(self.nickNameLabel.frame) + margin;
        CGFloat vipWH = 14;
        CGFloat vipY = nickNameY + (nickNameH - vipWH) * 0.5 ;
        self.vipImageView.frame = CGRectMake(vipX, vipY, vipWH, vipWH);
    }

    
    // 需要换行
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(self.iconImageView.frame) + margin;
    CGFloat textW = self.contentView.frame.size.width - 2 * margin;
    CGSize size = CGSizeMake(textW, 100); // 最大的高度和宽度的限制
//    CGFloat textH = [self.model.text sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:size].height;
    CGFloat textH = [self.model.text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:14.0f]} context:nil].size.height;
    self.mainTextLabel.frame = CGRectMake(textX, textY, textW, textH);
    
    CGFloat cellH = 0;
    
    if (self.model.picture) {
        CGFloat pictureX = iconX;
        CGFloat pictureWH = 100;
        CGFloat pictureY = CGRectGetMaxY(self.mainTextLabel.frame) + margin;
        self.pictureImageView.frame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
    }
}


- (void)setModel:(wjStatusModel *)model {
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.nickNameLabel.text = model.name;
    
    if (model.isVip) {
        self.vipImageView.hidden = NO;
        self.nickNameLabel.textColor = [UIColor orangeColor];
    } else {
        self.vipImageView.hidden = YES;
        self.nickNameLabel.textColor = [UIColor blackColor];
    }
    
    self.mainTextLabel.text = model.text;
    if (model.picture) {
        self.pictureImageView.hidden = NO;
        self.pictureImageView.image = [UIImage imageNamed:model.picture];
    } else {
        self.pictureImageView.hidden = YES;
    }
}


@end
