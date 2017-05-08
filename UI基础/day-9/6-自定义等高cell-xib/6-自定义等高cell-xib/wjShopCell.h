//
//  wjShopCell.h
//  6-自定义等高cell-xib
//
//  Created by gouzi on 2017/5/8.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class wjShopListModel;

@interface wjShopCell : UITableViewCell

/** model*/
@property (nonatomic, strong) wjShopListModel *model;

@end
