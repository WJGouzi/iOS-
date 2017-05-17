//
//  wjAddContactViewController.h
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class wjContactModel, wjAddContactViewController;
@protocol wjAddContactListDelegate <NSObject>

@optional

- (void)addContactListWithViewController:(wjAddContactViewController *)addContactVC model:(wjContactModel *)model;

@end


@interface wjAddContactViewController : UIViewController

/** delegate */
@property (nonatomic, weak) id<wjAddContactListDelegate> delegate;

@end

