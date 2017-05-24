//
//  wjImageView.m
//  6-魔方系统的UIImageView
//
//  Created by gouzi on 2017/5/23.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjImageView.h"

@implementation wjImageView


- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect {

    // 把图片传递到view上
    
    [self.image drawInRect:rect];
    
}



- (instancetype)initWithImage:(UIImage *)image {

    if (self = [super init]) {
        // 确定当前imageView的尺寸大小
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        _image = image;
    }
    return self;
}






@end
