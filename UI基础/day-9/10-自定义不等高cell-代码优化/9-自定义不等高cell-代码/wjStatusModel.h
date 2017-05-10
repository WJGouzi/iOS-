//
//  wjStatusModel.h
//  9-自定义不等高cell-代码
//
//  Created by gouzi on 2017/5/9.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wjStatusModel : NSObject

/** icon*/
@property (nonatomic, copy) NSString *icon;

/** nickName*/
@property (nonatomic, copy) NSString *name;

/** text*/
@property (nonatomic, copy) NSString *text;

/* VIP*/
@property (nonatomic, assign, getter=isVip) BOOL vip;

/** pic*/
@property (nonatomic, copy) NSString *picture;




#pragma mark -  cell的frame 通过模型中转cell的高度给控制器
/** frame数据***/
/** 图像的frame */
@property (nonatomic, assign) CGRect iconFrame;
/** 昵称的frame */
@property (nonatomic, assign) CGRect nameFrame;
/** vip的frame */
@property (nonatomic, assign) CGRect vipFrame;
/** 正文frame */
@property (nonatomic, assign) CGRect textFrame;
/** 配图的frame */
@property (nonatomic, assign) CGRect pictureFrame;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

@end
