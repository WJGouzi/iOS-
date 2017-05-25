//
//  wjDoodleBoardView.h
//  7-画板
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface wjDoodleBoardView : UIView

/** 清屏*/
- (void)wjClearScreen;

/** 撤销 */
- (void)wjUndo;

/** 擦除*/
- (void)wjErase;

/** 线宽*/
- (void)wjSetLineWidth:(CGFloat)width;

/** 线的颜色*/
- (void)wjSetLineColor:(UIColor *)color;

@end
