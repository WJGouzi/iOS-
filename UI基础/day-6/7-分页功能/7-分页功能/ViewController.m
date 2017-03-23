//
//  ViewController.m
//  7-分页功能
//
//  Created by gouzi on 2017/3/22.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageController;
/** 定时器 */
@property (nonatomic, weak) NSTimer *timer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self scrollViewWithImageAndPageControlSettings];
    [self startTimer];
}

#pragma mark - 基本设置
- (void)scrollViewWithImageAndPageControlSettings {
    CGFloat scrollViewW = self.scrollView.frame.size.width;
    CGFloat scrollViewH = self.scrollView.frame.size.height;
    int imageCount = 5;
    for (int i = 0; i < imageCount; i++) {
        // 1.添加图片
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *imageName = [NSString stringWithFormat:@"img_0%d",i+1];
        imageView.image = [UIImage imageNamed:imageName];
        
        imageView.frame = CGRectMake(scrollViewW * i, 0, scrollViewW, scrollViewH);
        [self.scrollView addSubview:imageView];
    }
    
    // 2，设置
    self.scrollView.contentSize = CGSizeMake(imageCount * scrollViewW, scrollViewH);
    self.scrollView.delegate = self;
    // 分页是尺寸是按照UIScrollView的尺寸为准的。
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
    // 3.pageController
    //    self.pageController.currentPage = 0;
    self.pageController.hidesForSinglePage = YES; // 单页是是否隐藏
    /*
     if (imageCount == 1) {
     self.pageController.hidden = YES;
     } else {
     self.pageController.numberOfPages = imageCount;
     }
     */
    self.pageController.numberOfPages = imageCount;
    self.pageController.enabled = NO; // 不能和用户进行交互
    
    // 设置pageControl的图片
    // 利用KVC（私有的变量）
    [self.pageController setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
    [self.pageController setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];
}



#pragma mark - UIScrollViewDelegate
#pragma mark - 滚动到一半才开始页码修改
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 计算页码
    // 四舍五入
    int page = (int)(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5);
    // 设置页码
    self.pageController.currentPage = page;
}

#pragma mark -  === 完全移动后才进行页码修改
/*
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    // 计算页码
    int page = scrollView.contentOffset.x / scrollView.frame.size.width;
    // 设置页码
    self.pageController.currentPage = page;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (decelerate == NO) {
        // 计算页码
        int page = scrollView.contentOffset.x / scrollView.frame.size.width;
        // 设置页码
        self.pageController.currentPage = page;
    }
}
*/





/**
 *  线程问题
 *  主线程:程序一旦启动，系统就会默认创建一条线程。
 *  主线程作用:显示刷新UI界面，处理与用户的交互事件。主线程只能在同一时间处理一个任务。
 *  多线程原理:1s ---> 0.001s * 1000 ;第一个0.001s做UI的事情，第二个0.001s做另一件事件。这造成同一时间做不同事情的假象。
 */
#pragma mark - 自动滚动------定时器
- (void)startTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(automaticNextPage:) userInfo:nil repeats:YES];
    // 修改定时器所在的runLoop的模式
    // 目的:不管主线程在做什么，都会分配一定时间去处理定时器。
    /*
     NSDefaultRunLoopMode:默认，同一时间只能做一件事情。
     NSRunLoopCommonModes:类似一个集合，同一时间可以做不同的事情
     */
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)stopTimer {
    [self.timer invalidate];
    self.timer = nil;
}

/**
 自动滚动下一页
 */
- (void)automaticNextPage:(NSTimer *)tiemr {
    // 计算页码
    NSInteger nextPage = self.pageController.currentPage + 1;
    
    [self.scrollView setContentOffset:nextPage == 5 ? CGPointMake(0, 0) : CGPointMake(nextPage * self.scrollView.frame.size.width, 0) animated:YES];
    self.pageController.currentPage = nextPage == 5 ? 0 : nextPage;
    
}

/**
 用户即将拖拽scrollView的时候就要停止定时器
 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [self stopTimer];
}


/**
 用户已经停止拖拽scrollView的时候就要开启定时器
 */
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self startTimer];
}





@end
