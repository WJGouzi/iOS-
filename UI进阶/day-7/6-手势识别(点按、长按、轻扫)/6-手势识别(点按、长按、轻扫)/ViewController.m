//
//  ViewController.m
//  6-手势识别(点按、长按、轻扫)
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

    [self wjTapGesture];
    [self wjLongPressGesture];
    [self wjSwipeGesture];
}

#pragma mark - 点按手势
- (void)wjTapGesture {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    tap.delegate = self;
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:tap];
}

- (void)tapAction:(UITapGestureRecognizer *)tap {
    self.imageView.image = [UIImage imageNamed:@"minion"];
}

#pragma mark - 长按手势
- (void)wjLongPressGesture {
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:longPress];
}

// 当长按移动时，该方法会一直调用
- (void)longPressAction:(UILongPressGestureRecognizer *)longPress {
    // 判断手势的状态
    if (longPress.state == UIGestureRecognizerStateBegan) {
        // 开始长按
        self.imageView.image = [UIImage imageNamed:@""];
    } else if (longPress.state == UIGestureRecognizerStateChanged) {
        // 长按时移动
        [self wjShowAlertNoticeWithTitle:@"notice" message:@"don't move your finger" actionTitle:@"ok"];
    } else if (longPress.state == UIGestureRecognizerStateEnded) {
        [self wjShowAlertNoticeWithTitle:@"notice" message:@"long press is finished" actionTitle:@"ok"];
    }
}


#pragma mark - 轻扫手势
- (void)wjSwipeGesture {
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    self.imageView.userInteractionEnabled = YES;
    [self.imageView addGestureRecognizer:swipe];
}

- (void)swipeAction:(UISwipeGestureRecognizer *)swipe {
    // 滑动的方向
    swipe.direction = UISwipeGestureRecognizerDirectionLeft; // 一个轻扫手势只能对应一个方向->如果需要另一个方向则需要另外创建一个手势
    [self wjShowAlertNoticeWithTitle:@"notice" message:@"direction is left hand" actionTitle:@"ok"];
}



#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    // 需求，图片的左边是可以点击的，右边是不能进行点击的
    
    // 获取手指的点
    CGPoint currentP = [touch locationInView:self.imageView];
    
    // 判断左右
    if (currentP.x > self.imageView.frame.size.width * 0.5) {
        // 在右边
        return NO;
    } else {
        // 在左边
        return YES;
    }
    
}


#pragma mark - 通用方法
#pragma mark - 通用的方法
/**
 显示提示框
 
 @param title 提示标题
 @param message 提示信息
 @param actionTitle 按钮文字
 */
- (void)wjShowAlertNoticeWithTitle:(NSString *)title message:(NSString *)message actionTitle:(NSString *)actionTitle {
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *action = [UIAlertAction actionWithTitle:actionTitle style:UIAlertActionStyleDefault handler:nil];
    [alertVC addAction:action];
    [self presentViewController:alertVC animated:YES completion:nil];
}



@end
