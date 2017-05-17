//
//  wjEditContactVC.h
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class wjContactModel;
typedef void(^wjEditSaveBlock)(wjContactModel *model);

@interface wjEditContactVC : UIViewController

/** model */
@property (nonatomic, strong) wjContactModel *model;


/** block */
@property (nonatomic, strong) wjEditSaveBlock block;

@end
