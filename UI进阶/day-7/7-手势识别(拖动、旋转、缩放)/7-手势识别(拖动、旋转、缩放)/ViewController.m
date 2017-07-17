//
//  ViewController.m
//  7-手势识别(拖动、旋转、缩放)
//
//  Created by gouzi on 2017/7/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wjPanGesture];
    [self wjPinchGesture];
    [self wjRotateGesture];
}

#pragma mark - 拖动手势
- (void)wjPanGesture {
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.imageView addGestureRecognizer:pan];
}

- (void)panAction:(UIPanGestureRecognizer *)pan {
    // 获取偏移量->(获取的是最原始的点的偏移量)
    CGPoint movePoint = [pan translationInView:self.imageView];
    NSLog(@"move point is : %@", NSStringFromCGPoint(movePoint));
    self.imageView.transform = CGAffineTransformTranslate(self.imageView.transform, movePoint.x, movePoint.y);
    [pan setTranslation:CGPointZero inView:self.imageView]; // 清空上一次的偏移下一次又从(0,0)开始
}

#pragma mark - 缩放手势
- (void)wjPinchGesture {
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinchAction:)];
    pinch.delegate = self;
    [self.imageView addGestureRecognizer:pinch];
}

- (void)pinchAction:(UIPinchGestureRecognizer *)pinch {
    self.imageView.transform = CGAffineTransformScale(self.imageView.transform, pinch.scale, pinch.scale);
    [pinch setScale:1.0]; // 复原到原始值
}


#pragma mark - 旋转
- (void)wjRotateGesture {
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotationAction:)];
    rotation.delegate = self;
    [self.imageView addGestureRecognizer:rotation];
}

- (void)rotationAction:(UIRotationGestureRecognizer *)rotation {
    self.imageView.transform = CGAffineTransformRotate(self.imageView.transform, rotation.rotation);
    [rotation setRotation:0]; // 复位
}

#pragma mark - UIGestureRecognizerDelegate
// 允许多个手势同时执行
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}

@end
