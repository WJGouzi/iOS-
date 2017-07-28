//
//  wjWheelView.m
//  12-大转盘
//
//  Created by gouzi on 2017/7/26.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjWheelView.h"
#import "wjWheelBtn.h"

#define angleToRad(angle) ((angle) / 180.0f * M_PI)


@interface wjWheelView () <CAAnimationDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *wjContentView;

// 当前选中的按钮
@property (nonatomic, weak) UIButton *selectedBtn;

/** */
@property (nonatomic, strong) CADisplayLink *display;

@end

@implementation wjWheelView

- (CADisplayLink *)display {
    if (!_display) {
        CADisplayLink *display = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateFrame)];
        [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
        _display = display;
    }
    return _display;
}



+ (instancetype)wheelView {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil].lastObject;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self = [[NSBundle mainBundle] loadNibNamed:@"wjWheelView" owner:nil options:nil].lastObject;
    }
    return self;
}

// 添加转盘上的按钮
- (void)awakeFromNib {
    [super awakeFromNib];
    self.wjContentView.userInteractionEnabled = YES;
    CGFloat btnW = 68;
    CGFloat btnH = 143;
    // 加载原始的大图
    UIImage *originalImage = [UIImage imageNamed:@"LuckyAstrology"];
    UIImage *originImageSelected = [UIImage imageNamed:@"LuckyAstrologyPressed"];
    CGFloat angle = 0;
    CGFloat X = 0;
    CGFloat Y = 0;
    CGFloat H = originalImage.size.height * [UIScreen mainScreen].scale;
    CGFloat W = originalImage.size.width / 12.0f * [UIScreen mainScreen].scale;
    for (int i = 0; i < 12; i++) {
        // 创建按钮
        wjWheelBtn *btn = [wjWheelBtn buttonWithType:UIButtonTypeCustom];
        // 设置选中的背景图片
        [btn setBackgroundImage:[UIImage imageNamed:@"LuckyRototeSelected"] forState:UIControlStateSelected];
        // 设置按钮的正常状态显示的图片
        X = i * W;
        CGRect rect = CGRectMake(X, Y, W, H);
        // 截取给定图片的指定区域的图片
        CGImageRef clipImage = CGImageCreateWithImageInRect(originalImage.CGImage, rect);
        UIImage *btnImage = [UIImage imageWithCGImage:clipImage];
        [btn setImage:btnImage forState:UIControlStateNormal];
        // 选中状态
        [btn setImage:[UIImage imageWithCGImage:CGImageCreateWithImageInRect(originImageSelected.CGImage, rect)] forState:UIControlStateSelected];
        
        // 确定大小及位置
        btn.bounds = CGRectMake(0, 0, btnW, btnH);
        // 设置锚点
        btn.layer.anchorPoint = CGPointMake(0.5, 1);
        btn.layer.position = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
        btn.transform = CGAffineTransformMakeRotation(angleToRad(angle));
        angle += 30;
        // 监听按钮的点击
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.wjContentView addSubview:btn];
        if (i == 0) {
            [self btnClick:btn];
        }
    }
    
}

- (void)btnClick:(UIButton *)btn {
//    btn.selected = YES;
    // 1.当前选中的按钮取消选中
    self.selectedBtn.selected = NO;
    // 2.让当前点击的按钮成为选中状态
    btn.selected = YES;
    // 3.当前的点击的按钮成为选中的按钮
    self.selectedBtn = btn;
}


#pragma mark - 进行一系列的操作
// 开始旋转
- (void)rotate {
    
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"transform.rotation";
//    animation.toValue = @(M_PI * 3);
//    animation.duration = 1;
//    animation.repeatCount = MAXFLOAT;
//    [self.wjContentView.layer addAnimation:animation forKey:nil];

    // 让转盘做真实的旋转
    // 一直旋转->添加定时器
//    CADisplayLink *display = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateFrame)];
//    [display addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.display.paused = NO;
}

- (void)updateFrame {
    self.wjContentView.transform = CGAffineTransformRotate(self.wjContentView.transform, M_PI / 210);
}


// 停止旋转
- (void)stop {
    self.display.paused = YES;
}


- (IBAction)wjStartChooseAction:(UIButton *)sender {
    // 让转盘快速旋转几圈，当前选中的按钮指向最上方
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"transform.rotation";
    animation.toValue = @(M_PI * 2);
    animation.duration = 0.5;
    animation.delegate = self;
    [self.wjContentView.layer addAnimation:animation forKey:nil];
    
    // 动画结束时指向最上方

}

#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    // 动画结束时指向最上方
    // 获取选中按钮的旋转角度
    CGAffineTransform transform = self.selectedBtn.transform;
    CGFloat angele = atan2(transform.b, transform.a); // 已经是弧度了，所以不需要再次做转换
    // 让选中的按钮的父控件倒着旋转回去
    self.wjContentView.transform = CGAffineTransformMakeRotation(-angele);
//    self.display.paused = YES;
}



@end
