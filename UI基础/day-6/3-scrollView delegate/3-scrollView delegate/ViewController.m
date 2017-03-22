//
//  ViewController.m
//  3-scrollView delegate
//
//  Created by gouzi on 2017/3/22.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 基本设置
    [self scrollViewBasicSettings];
    
}


#pragma mark- scrollView的基本设置
- (void)scrollViewBasicSettings {
    // scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    scrollView.backgroundColor = [UIColor lightTextColor];
    [self.view addSubview:scrollView];
    // 通过代码创建scrollView的时候，一开始subviews数组为空
    NSLog(@"subviews is : %@", scrollView.subviews);
    
    // 图片
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    NSLog(@"subviews is : %@", scrollView.subviews);
    
    scrollView.contentSize = image.size;
    
    // delegate
    // delegate是scrollView的代理属性
    // self是scrollView的代理对象
    scrollView.delegate = self;
}

#pragma mark - UIScrollViewDelegate

/**
 scrollView正处于滚动状态的时候就会调用这个方法（自动调用这个方法）
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    NSLog(@"正在滚动");
}


/**
 即将开始滚动
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    NSLog(@"即将开始滚动");
}


/**
 即将停止滚动
 */
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    NSLog(@"即将停止拖拽");
}


/**
 已经结束拖拽
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate == NO) {
        NSLog(@"用户已经停止拖拽scrollView，停止滚动");
    } else {
        NSLog(@"用户已经停止拖拽scrollView，但是由于惯性，仍然在滚动，当减速完毕后就会停止滚动");
    }
}


/**
 减速完毕后会调用，后停止滚动
 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSLog(@"减速完毕");
}




@end
