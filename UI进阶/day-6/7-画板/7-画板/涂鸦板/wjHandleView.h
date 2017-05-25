//
//  wjHandleView.h
//  7-画板
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class wjHandleView;
@protocol wjHandleViewDelegate <NSObject>

@optional
- (void)handleImageView:(wjHandleView *)handleImageView newImage:(UIImage *)newImage;

@end

@interface wjHandleView : UIView

/** image */
@property (nonatomic, strong) UIImage *image;

/** delegate */
@property (nonatomic, weak) id<wjHandleViewDelegate> delegate;

@end
