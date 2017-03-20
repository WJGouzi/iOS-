//
//  wjCarView.m
//  1-xibBaiscUse
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjCarView.h"
#import "wjCarModel.h"

@implementation wjCarView


// 重写initWithFrame
/*
    子控件的初始化
 */
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // 创建图片
        
        // 创建标题
        
        // 创建子标题
        
        // 创建跟帖对象
        
    }
    return self;
}


/*
    子控件的布局
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    // 对子控件进行布局
    
}


- (void)setCarModel:(wjCarModel *)model {
    _carModel = model;
    // 设置子控件的数据
    
}

@end
