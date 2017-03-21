//
//  ViewController.m
//  2-showBigSizeImage
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
//    CGFloat imageW = image.size.width;
//    CGFloat imageH = image.size.height;
    self.scrollView.contentSize = image.size;//CGSizeMake(imageW, imageH);
    
    // 常见的基本属性
    self.scrollView.bounces = NO; // 回弹效果
    
//    [self indicatorView];
    
    // 滚动条
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    
    
}


// 设置菊花
- (void)indicatorView {
    /*
     UIActivityIndicatorViewStyleWhiteLarge,
     UIActivityIndicatorViewStyleWhite,
     UIActivityIndicatorViewStyleGray
     */
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.center = CGPointMake(100, -40);
    [indicatorView startAnimating];
    [self.scrollView addSubview:indicatorView];
    
    // 只有在没有设置从contentSize的时候才会有用
    self.scrollView.alwaysBounceVertical = YES; // 不能进行滚动，只是有个弹簧效果而已
    self.scrollView.alwaysBounceHorizontal = NO;
}

@end
