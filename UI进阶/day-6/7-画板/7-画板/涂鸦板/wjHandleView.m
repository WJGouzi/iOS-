//
//  wjHandleView.m
//  7-画板
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjHandleView.h"

@interface wjHandleView () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIImageView *imageView;

@end


@implementation wjHandleView

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.userInteractionEnabled = YES;
        [self addSubview:_imageView];
        [self handleViewAddGesture];
    }
    return _imageView;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    self.imageView.image = image;
}


- (void)handleViewAddGesture {
    // pan
    // 拖拽手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]
                                   initWithTarget:self action:@selector(pan:)];
    
    [self.imageView addGestureRecognizer:pan];
    
    // pinch
    // 捏合
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
    
    pinch.delegate = self;
    [self.imageView addGestureRecognizer:pinch];
    
    
    //添加旋转
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotation:)];
    rotation.delegate = self;
    
    [self.imageView addGestureRecognizer:rotation];
    
    // 长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    [self.imageView addGestureRecognizer:longPress];
}


#pragma mark - 手势操作

//捏合的时候调用.
- (void)pinch:(UIPinchGestureRecognizer *)pinch {
    pinch.view.transform = CGAffineTransformScale( pinch.view.transform, pinch.scale, pinch.scale);
    // 复位
    pinch.scale = 1;
}


//旋转的时候调用
- (void)rotation:(UIRotationGestureRecognizer *)rotation {
    // 旋转图片
    rotation.view.transform = CGAffineTransformRotate(rotation.view.transform, rotation.rotation);
    // 复位,只要想相对于上一次旋转就复位
    rotation.rotation = 0;
}


//长按的时候调用
// 什么时候调用:长按的时候调用,而且只要手指不离开,拖动的时候会一直调用,手指抬起的时候也会调用
- (void)longPress:(UILongPressGestureRecognizer *)longPress {
    if (longPress.state == UIGestureRecognizerStateBegan) {
        
        [UIView animateWithDuration:0.25 animations:^{
            //设置为透明
            self.imageView.alpha = 0;
        }completion:^(BOOL finished) {
            [UIView animateWithDuration:0.25 animations:^{
                self.imageView.alpha = 1;
                
                //把当前的View做一个截屏
                UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
                //获取上下文
                CGContextRef ctx = UIGraphicsGetCurrentContext();
                [self.layer renderInContext:ctx];
                UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
                //关闭上下文.
                UIGraphicsEndImageContext();
                
                //调用代理方法
                if([self.delegate respondsToSelector:@selector(handleImageView:newImage:)]) {
                    [self.delegate handleImageView:self newImage:newImage];
                }
                //从父控件当中移除
                [self removeFromSuperview];
                
            }];
        }];
        
        
    }
    
}

//拖动的时候调用
- (void)pan:(UIPanGestureRecognizer *)pan {
    CGPoint transP = [pan translationInView:pan.view];
    pan.view.transform = CGAffineTransformTranslate(pan.view.transform, transP.x, transP.y);
    //复位
    [pan setTranslation:CGPointZero inView:pan.view];
}


//能够同时支持多个手势
-(BOOL)gestureRecognizer:(nonnull UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(nonnull UIGestureRecognizer *)otherGestureRecognizer{
    
    return YES;
}

@end
