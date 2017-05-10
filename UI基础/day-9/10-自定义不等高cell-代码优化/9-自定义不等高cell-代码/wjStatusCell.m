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


// 计算子控件的尺寸
// 后调用
- (void)layoutSubviews {
    [super layoutSubviews];
    
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
    self.iconImageView.frame = self.model.iconFrame;
    self.nickNameLabel.frame = self.model.nameFrame;
    self.vipImageView.frame = self.model.vipFrame;
    self.mainTextLabel.frame = self.model.textFrame;
    self.pictureImageView.frame = self.model.pictureFrame;
}


@end
