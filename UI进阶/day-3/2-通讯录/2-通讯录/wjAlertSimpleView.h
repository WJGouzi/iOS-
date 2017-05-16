//
//  wjAlertView.h
//  test
//
//  Created by gouzi on 2017/4/20.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wjAlertSimpleView : UIView


/**
 构造方法
 
 @param imageName 图片的名称
 @param noticeText 提示的文字
 @param dismissTime 消失的时间
 */
- (instancetype)initWithNoticeImage:(NSString *)imageName mainTitle:(NSString *)noticeText dismissTime:(float)dismissTime;


/**
 带有固定提示图片的及文字的提示器
 
 @param noticeText 提示文字
 */
- (instancetype)initWithNoticeTitle:(NSString *)noticeText;


/**
 带有小菊花的提示器
 
 @param noticeText 提示文字
 @param dismissTime 消失的时间
 */
- (instancetype)initWithNoticeIndicatorWithTitle:(NSString *)noticeText dismissTime:(float)dismissTime;


/**
 带有小菊花不自动小时的提示器
 
 @param noticeText 提示文字
 */
- (instancetype)initWithNoticeIndicatorWithTitle:(NSString *)noticeText;


/**
 删除
 */
- (void)indicatorViewRemoveFromSuperview;


@end

