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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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

@end
