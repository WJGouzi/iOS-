//
//  ViewController.m
//  4-图片截取
//
//  Created by gouzi on 2017/5/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

// 开始手指的点
/* startPoint*/
@property (nonatomic, assign) CGPoint startPoint;

/** coverView*/
@property (nonatomic, strong) UIView *coverView;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView.userInteractionEnabled = YES;
}


- (UIView *)coverView {
    if (!_coverView) {
        _coverView = [[UIView alloc] init];
        _coverView.backgroundColor = [UIColor blackColor];
        _coverView.alpha = 0.7;
//        [self.view addSubview:_coverView]; // 放在这里  下次进入就没有coverView
    }
    return _coverView;
}




// 在storyBoard中拖入的一个手势
- (IBAction)panInPicture:(UIPanGestureRecognizer *)pan {

    CGPoint currentPoint = [pan locationInView:self.view];
    // 1判断手势状态
    if (pan.state == UIGestureRecognizerStateBegan) {
        // 获取当前点
        self.startPoint = currentPoint;
    } else if (pan.state == UIGestureRecognizerStateChanged) {
        CGFloat x = self.startPoint.x;
        CGFloat y = self.startPoint.y;
        CGFloat width = currentPoint.x - self.startPoint.x;
        CGFloat height = currentPoint.y - self.startPoint.y;
        CGRect rect = CGRectMake(x, y, width, height);
        
        // 添加一个view
        self.coverView.frame = rect;
        [self.view addSubview:_coverView]; // 解决下次进行裁剪的时候没有coverview的覆盖
    } else if (pan.state == UIGestureRecognizerStateEnded) {
        // 超过遮盖以外的内容裁剪掉
        UIGraphicsBeginImageContextWithOptions(self.imageView.bounds.size, NO, 0);
        // 设置一个裁剪区域
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRect:self.coverView.frame];
        [clipPath addClip];
        // 进行渲染
        CGContextRef ctx = UIGraphicsGetCurrentContext();
        [self.imageView.layer renderInContext:ctx];
        // 生成一张图片
        UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        self.imageView.image = newImage;
        // 移除遮盖
        [self.coverView removeFromSuperview];
        
    }
    
    
    
}

@end
