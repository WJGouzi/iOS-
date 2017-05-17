//
//  wjAddContactVC.h
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>


@class wjAddContactVC, wjContactModel;
@protocol wjAddContactVCDelegate <NSObject>
@optional
- (void)addContactVC:(wjAddContactVC *)vc name:(NSString *)name phoneNumber:(NSString *)phoneNumberStr;

- (void)addContactVC:(wjAddContactVC *)vc model:(wjContactModel *)model;

@end


@interface wjAddContactVC : UIViewController

/** delegate */
@property (nonatomic, weak) id<wjAddContactVCDelegate> delegate;

@end
