//
//  ViewController.m
//  1-轮播器功能封装
//
//  Created by gouzi on 2017/3/23.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import "wjPageView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wj_ScorllViewWithPageControl];
}


- (void)wj_ScorllViewWithPageControl {
    wjPageView *pageView = [wjPageView pageView];
//    pageView.center = self.view.center;
    
    /*
     *  此处自定义scrollView的位置
     *  pageView xib 关闭了autoLayout的选项
     *  也能进行自适应-> autoresizing
     */
    pageView.frame = CGRectMake(0, 20, self.view.frame.size.width, 150);
    
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:0];
    for (int i = 1; i <= 5; ++i) {
        [images addObject:[NSString stringWithFormat:@"img_0%d", i]];
    }
//    NSLog(@"%@", images);
    pageView.imageNames = [images copy];
    [self.view addSubview:pageView];
}


@end
