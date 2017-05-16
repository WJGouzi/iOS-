//
//  wjAlertView.m
//  test
//
//  Created by gouzi on 2017/4/20.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjAlertSimpleView.h"

#define alertViewWidth self.alertView.frame.size.width
#define alertViewHeight self.alertView.frame.size.height
#define wjMainColor [UIColor whiteColor]

@interface wjAlertSimpleView ()

// 提示图片
@property (nonatomic, strong) UIImageView *noticeImageView;

// 提示文字
@property (nonatomic, strong) UILabel *textLabel;

/** 提示框*/
@property (nonatomic, strong) UIView *alertView;

/** 小菊花*/
@property (nonatomic, strong) UIActivityIndicatorView *wjIndicatorView;

@end

@implementation wjAlertSimpleView

#pragma mark - 构造方法
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self addAlertView];
    }
    return self;
}

- (instancetype)initWithNoticeTitle:(NSString *)noticeText {
    return [self initWithNoticeImage:@"ic_sign_wrong_nor" mainTitle:noticeText dismissTime:2.0f];
}


- (instancetype)initWithNoticeImage:(NSString *)imageName mainTitle:(NSString *)noticeText dismissTime:(float)dismissTime {
    if (self = [self initWithFrame:[[UIScreen mainScreen] bounds]]) {
        self.noticeImageView.image = [UIImage imageNamed:imageName];
        self.textLabel.text = noticeText;
        [self layOutViews];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dismissTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                [self removeFromSuperview];
            }];
        });
    }
    
    return self;
}

- (instancetype)initWithNoticeIndicatorWithTitle:(NSString *)noticeText dismissTime:(float)dismissTime {
    if (self = [self initWithFrame:[UIScreen mainScreen].bounds]) {
        self.textLabel.text = noticeText;
        [self indicatorViewLayoutSubview];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dismissTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.5 animations:^{
                [self.wjIndicatorView stopAnimating];
                [self removeFromSuperview];
            }];
        });;
    }
    return self;
}

- (instancetype)initWithNoticeIndicatorWithTitle:(NSString *)noticeText {
    if (self = [self initWithFrame:[UIScreen mainScreen].bounds]) {
        self.textLabel.text = noticeText;
        [self indicatorViewLayoutSubview];
    }
    return self;
}


- (void)indicatorViewRemoveFromSuperview {
    [UIView animateWithDuration:0.5 animations:^{
        [self.wjIndicatorView stopAnimating];
        [self removeFromSuperview];
    }];
}

#pragma mark - getter setter
- (UIImageView *)noticeImageView {
    if (!_noticeImageView) {
        _noticeImageView = [[UIImageView alloc] init];
    }
    return _noticeImageView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
    }
    return _textLabel;
}

- (UIView *)alertView {
    if (!_alertView) {
        _alertView = [[UIView alloc] init];
    }
    return _alertView;
}

- (UIActivityIndicatorView *)wjIndicatorView {
    if (!_wjIndicatorView) {
        _wjIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _wjIndicatorView.color = wjMainColor;
        [_wjIndicatorView startAnimating];
    }
    return _wjIndicatorView;
}

#pragma mark - 带有图片及文字的提示器
#pragma mark - 子控件的布局
/** 布局子控件*/
- (void)layOutViews {
    [self addAlertView];
    [self noticeViewSettings];
    [self titileLabelSettings];
    
    NSArray* windows = [UIApplication sharedApplication].windows;
    UIView *window = [windows objectAtIndex:0];
    [window addSubview:self];
}


/** 添加提醒框*/
- (void)addAlertView {
    self.alertView.center = self.center;
    CGFloat alertWidth;
    CGFloat textSize = self.textLabel.text.length;
    CGFloat textWidth = 17 * textSize + textSize - 1; // 17号字体的适配
    alertWidth = textWidth;
    if (alertWidth <= 160) {
        alertWidth = 160;
    } else {
        alertWidth = textWidth;
    }
    self.alertView.bounds = CGRectMake(0, 0, alertWidth, 101);
    self.alertView.backgroundColor = [UIColor blackColor];
    self.alertView.alpha = 0.7;
    self.alertView.layer.masksToBounds = YES;
    self.alertView.layer.cornerRadius = 5.f;
    [self addSubview:self.alertView];
}


/** 提示图片的设置*/
- (void)noticeViewSettings {
    self.noticeImageView.frame = CGRectMake(alertViewWidth * 0.5 - 15, 15, 30, 30);
    [self.alertView addSubview:self.noticeImageView];
}


/** 标题的设置*/
- (void)titileLabelSettings {
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.font = [UIFont systemFontOfSize:17.0f];
    self.textLabel.textColor = [UIColor whiteColor];
    CGFloat textY = self.noticeImageView.frame.size.height + 30;
    self.textLabel.frame = CGRectMake(0, textY, alertViewWidth, 25);
    [self.alertView addSubview:self.textLabel];
}



#pragma mark - 带有小菊花的提示器
#pragma mark - 子控件的布局
// 布局子控件
- (void)indicatorViewLayoutSubview {
    [self addAlertView];
    [self indicatorViewSettings];
    [self indicatorNoticeTextSettings];
    
    NSArray* windows = [UIApplication sharedApplication].windows;
    UIView *window = [windows objectAtIndex:0];
    [window addSubview:self];
}


// 小菊花的设置
- (void)indicatorViewSettings {
    self.wjIndicatorView.frame = CGRectMake(alertViewWidth * 0.5 - 15, 15, 30, 30);
    [self.alertView addSubview:self.wjIndicatorView];
}

- (void)indicatorNoticeTextSettings {
    // 主标题
    self.textLabel.textAlignment = NSTextAlignmentCenter;
    self.textLabel.font = [UIFont systemFontOfSize:17.0f];
    self.textLabel.textColor = [UIColor whiteColor];
    CGFloat textY = self.wjIndicatorView.frame.size.height + 30;
    self.textLabel.frame = CGRectMake(0, textY, alertViewWidth, 25);
    [self.alertView addSubview:self.textLabel];
}



@end
