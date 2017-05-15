//
//  wjCountryFlagView.h
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class wjCountryFlagModel;

@interface wjCountryFlagView : UIView

/** model*/
@property (nonatomic, strong) wjCountryFlagModel *model;


+ (instancetype)countryFlagView;


@end
