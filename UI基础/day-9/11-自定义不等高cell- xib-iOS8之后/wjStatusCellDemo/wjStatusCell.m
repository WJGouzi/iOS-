//
//  wjStatusCell.m
//  wjStatusCellDemo
//
//  Created by gouzi on 2017/5/10.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjStatusCell.h"
#import "wjStatusModel.h"

@interface wjStatusCell ()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *vipImageView;
@property (weak, nonatomic) IBOutlet UILabel *mainTextLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImgaeView;

#pragma mark - 约束
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wjPictureImageViewHeight;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *wjPictureImageViewToBottom;

@end


@implementation wjStatusCell

- (void)setModel:(wjStatusModel *)model {
    _model = model;
    self.iconImageView.image = [UIImage imageNamed:model.icon];
    self.nameLabel.text = model.name;
    
    if (model.isVip) {
        self.vipImageView.hidden = NO;
        self.nameLabel.textColor = [UIColor orangeColor];
    } else {
        self.vipImageView.hidden = YES;
        self.nameLabel.textColor = [UIColor blackColor];
    }
    
    self.mainTextLabel.text = model.text;
    
    if (model.picture) {
        self.pictureImgaeView.hidden = NO;
        self.pictureImgaeView.image = [UIImage imageNamed:model.picture];
        self.wjPictureImageViewHeight.constant = 100;
        self.wjPictureImageViewToBottom.constant = 10;
    } else {
        self.pictureImgaeView.hidden = YES;
        self.wjPictureImageViewToBottom.constant = self.wjPictureImageViewHeight.constant = 0;
    }    
}

@end
