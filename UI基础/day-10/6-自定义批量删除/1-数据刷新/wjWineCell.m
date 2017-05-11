//
//  wjWineCell.m
//  1-数据刷新
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjWineCell.h"
#import "wjWineModel.h"


@interface wjWineCell ()

@property (nonatomic, strong) UIImageView *checkImageView;

@end


@implementation wjWineCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // 添加选中控件
        self.checkImageView = [[UIImageView alloc] init];
        self.checkImageView.hidden = YES;
        self.checkImageView.image = [UIImage imageNamed:@"check"];
        [self.contentView addSubview:self.checkImageView];
    }
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    // 选中控件
    CGFloat WH = 24;
    CGFloat X = self.contentView.frame.size.width - WH - 10;
    CGFloat Y = (self.contentView.frame.size.height - WH) * 0.5;
    self.checkImageView.frame = CGRectMake(X, Y, WH, WH);
    
    // 调整label的宽度
    CGRect labelFrame = self.textLabel.frame;
    labelFrame.size.width = self.contentView.frame.size.width - WH - 20 - self.textLabel.frame.origin.x;
    self.textLabel.frame = labelFrame;
}






- (void)setModel:(wjWineModel *)model {
    _model = model;
    self.textLabel.text = model.name;
    self.imageView.image = [UIImage imageNamed:model.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥%@", model.money];
    
    if (model.checked) {
        self.checkImageView.hidden = NO;
    } else {
        self.checkImageView.hidden = YES;
    }
    
}

@end
