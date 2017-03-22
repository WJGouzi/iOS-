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
    self.scrollView.contentSize = image.size;
    
    // 常见的基本属性
    self.scrollView.bounces = NO; // 回弹效果
    
//    [self indicatorView];
    
//    [self basicPropertySettings];
    [self contenInsetEdgeSettings];
    
}


#pragma mark - 内边距设置
- (void)contenInsetEdgeSettings {
    self.scrollView.contentInset = UIEdgeInsetsMake(10, 20, 30, 40);
    
}


#pragma mark - 按钮的点击事件
- (IBAction)top:(UIButton *)sender {
    // 回到顶部
    // 方式一:
    /*
    [UIView animateWithDuration:0.5 animations:^{
        CGPoint offset = self.scrollView.contentOffset;
        offset.y = 0;
        self.scrollView.contentOffset = offset;
    }];
    */
    
    
    // 方式二:
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 0) animated:YES]; // 动画的时间是不能进行设置的
    
}

- (IBAction)rightTop:(UIButton *)sender {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.frame.size.width, 0) animated:YES];
}

- (IBAction)right:(UIButton *)sender {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentSize.width - self.scrollView.frame.size.width, self.scrollView.contentOffset.y) animated:YES];
}

- (IBAction)bottom:(UIButton *)sender {
    [self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, self.scrollView.contentSize.height - self.scrollView.frame.size.height) animated:YES];

}

- (IBAction)leftBottom:(UIButton *)sender {
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentSize.height - self.scrollView.frame.size.height) animated:YES];

}

- (IBAction)left:(UIButton *)sender {
    [self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y) animated:YES];

}



/**
 点击控制器的view会自动调用此方法
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"%s", __func__);
}


// 一些基本属性的设置
- (void)basicPropertySettings {
    // 作用1:设置内容滚动的位置（setter方法）
    // 作用2:得知内容滚动的位置（getter方法）
    self.scrollView.contentOffset = CGPointMake(100, 100); // 计算方式:scrollView的origin - contentSize的origin
    
    
}


#pragma mark - 滚动条的设置
// 滚动条
- (void)showScrollViewIndicator {
    self.scrollView.showsVerticalScrollIndicator = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
}



#pragma mark - 菊花的指示的设置
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
