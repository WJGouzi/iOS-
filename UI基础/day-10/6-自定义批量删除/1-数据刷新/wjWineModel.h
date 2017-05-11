//
//  wjWineModel.h
//  1-数据刷新
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface wjWineModel : NSObject

/**
 *  图标
 */
@property (nonatomic ,copy)NSString *image;

/**
 *  价格
 */
@property (nonatomic ,copy)NSString *money;

/**
 *  名字
 */
@property (nonatomic ,copy)NSString *name;


/* clicked*/
@property (nonatomic, assign, getter=isChecked) BOOL checked;


@end
