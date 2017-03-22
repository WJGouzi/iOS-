//
//  ViewController.m
//  6-内容缩放
//
//  Created by gouzi on 2017/3/22.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate >
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

/** image */
@property (nonatomic, weak) UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self scrollViewBasicSettings];
    
    
}

#pragma mark- scrollView的基本设置
- (void)scrollViewBasicSettings {
    // 图片
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
    self.imageView = imageView;
    self.scrollView.contentSize = image.size;

    // 手指放在scrollView上进行缩放的时候，scrollView是知道的，但是需要通过代理方法来通知哪个子控件进行缩放
    self.scrollView.delegate = self;
    
    // 缩放的比例
    self.scrollView.maximumZoomScale = 3.0f;
    self.scrollView.minimumZoomScale = 0.4f;
}


#pragma mark - delegate
/**
 返回需要缩放的子控件
 */
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    
    return self.imageView;
}


/**
 正在缩放
 */
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
    NSLog(@"正在缩放");
}



@end
