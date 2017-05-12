//
//  wjShopCarCell.h
//  1-购物车
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>
@class wjShopCarModel, wjShopCarCell;

@protocol wjShopCellDelegate <NSObject>

@optional
- (void)plusBtnAction:(wjShopCarCell *)cell;

- (void)minusBtnAction:(wjShopCarCell *)cell;

@end



@interface wjShopCarCell : UITableViewCell

/** model */
@property (nonatomic, strong) wjShopCarModel *model;


/** delegate */
@property (nonatomic, weak) id<wjShopCellDelegate> wjDelegate;


@end
