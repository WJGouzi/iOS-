//
//  wjWineCell.m
//  1-数据刷新
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjWineCell.h"
#import "wjWineModel.h"

@implementation wjWineCell


- (void)setModel:(wjWineModel *)model {
    _model = model;
    self.textLabel.text = model.name;
    self.imageView.image = [UIImage imageNamed:model.image];
    self.detailTextLabel.text = [NSString stringWithFormat:@"¥%@", model.money];
}

@end
