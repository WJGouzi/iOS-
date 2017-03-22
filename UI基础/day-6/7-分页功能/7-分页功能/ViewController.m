//
//  ViewController.m
//  7-分页功能
//
//  Created by gouzi on 2017/3/22.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

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
    // 分页是尺寸是按照UIScrollView的尺寸为准的。
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    
}


@end
