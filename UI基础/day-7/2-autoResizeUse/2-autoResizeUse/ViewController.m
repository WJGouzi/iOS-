//
//  ViewController.m
//  2-autoResizeUse
//
//  Created by gouzi on 2017/3/23.
//  Copyright © 2017年 王钧. All rights reserved.
//

/*
 *  需求:子控件在父控件某个位置，不管屏幕尺寸的变化，都只显示在那个位置
 */
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*
 *  注意:要使用autoResizing的技术必须要支持autoLayout
 *      这个项目中的把autoResizing 和 autoLayout在storyboard中已经关掉了。
 */


/*  autoresizing的设置方法
 *  在storyboard中->show the siee inspector -> view -> autoresizing -> 内部的六根线
 *  注意点:
 *  1> 外边的四根线限定子控件相对于父控件的位置
 *      1.1>如果同时出现四根线，上左的两根线的"优先级"会高于右下的两根线
 *      1.2>这些线的限定是以其父控件为基准的
 *  2> 内部的两根线选择代表子控件的宽高会跟随着父控件的大小而进行伸缩
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
}



@end
