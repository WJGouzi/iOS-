//
//  wjDragViewController.m
//  8-抽屉效果
//
//  Created by gouzi on 2017/7/18.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjDragViewController.h"

@interface wjDragViewController ()

@property (nonatomic, weak) UIView *leftView;
@property (nonatomic, weak) UIView *rightView;
@property (nonatomic, weak) UIView *mainView;



@end

@implementation wjDragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wjUIViewSettings];
    
    // 添加手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    self.mainView.userInteractionEnabled = YES;
    [self.mainView addGestureRecognizer:pan];
    
    // 添加点击手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
}


/**
 界面搭建
 */
- (void)wjUIViewSettings {
    // leftView
    UIView *leftView = [[UIView alloc] initWithFrame:self.view.bounds];
    leftView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:leftView];
    self.leftView = leftView;
    // rightView
    UIView *rightView = [[UIView alloc] initWithFrame:self.view.bounds];
    rightView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:rightView];
    self.rightView = rightView;
    // 中间的view
    UIView *mainView = [[UIView alloc] initWithFrame:self.view.bounds];
    mainView.backgroundColor = [UIColor redColor];
    [self.view addSubview:mainView];
    self.mainView = mainView;
}

#define targetRigthX 275
#define targetLeftX -275
#pragma mark - 手势的实现方法
- (void)panAction:(UIPanGestureRecognizer *)pan {
    // 获取偏移量
    CGPoint movePoint = [pan translationInView:self.mainView];
//    self.mainView.transform = CGAffineTransformTranslate(self.mainView.transform, movePoint.x, 0); // x轴移动就可以了 、因为在高度上mainView也在变化
    self.mainView.frame = [self frameWithOffsetX:movePoint.x];
    if (self.mainView.frame.origin.x > 0) {
        // 向右移动
        self.rightView.hidden = YES;
        
    } else if (self.mainView.frame.origin.x < 0) {
        // 向左移动
        self.rightView.hidden = NO;
    }
    
    // 当手指送开时，做自动定位的功能
    CGFloat target = 0;
    if (pan.state == UIGestureRecognizerStateEnded) {
        // 判断定位到左侧或右侧
        if (self.mainView.frame.origin.x > [UIScreen mainScreen].bounds.size.width * 0.5) {
            // 右侧
            target = targetRigthX;
        } else if (CGRectGetMaxX(self.mainView.frame) < [UIScreen mainScreen].bounds.size.width * 0.5) {
            // 左侧
            target = targetLeftX;
        }
        // 计算frame
        CGFloat offsetX = target - self.mainView.frame.origin.x;
        [UIView animateWithDuration:0.5 animations:^{
            self.mainView.frame = [self frameWithOffsetX:offsetX];
        }];
    }
    [pan setTranslation:CGPointZero inView:self.mainView];
}


- (void)tapAction:(UITapGestureRecognizer *)tap {
    // 复位操作
    [UIView animateWithDuration:0.5 animations:^{
        self.mainView.frame = self.view.bounds;
    }];
}



#pragma mark - 通用方法
/**
 根据偏移量算frame

 @param offsetX 圆点的偏移量
 @return 新的frame
 */
#define maxY 100
- (CGRect)frameWithOffsetX:(CGFloat)offsetX {
    CGRect frame = self.mainView.frame;
    frame.origin.x += offsetX;
    
    // 求y值
    frame.origin.y = fabs(frame.origin.x) * maxY / [UIScreen mainScreen].bounds.size.width;
    frame.size.height = [UIScreen mainScreen].bounds.size.height - 2 * (frame.origin.y);
    
    return frame;
}




@end
