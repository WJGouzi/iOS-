//
//  wjBirthdayTextField.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/15.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjBirthdayTextField.h"

@interface wjBirthdayTextField ()

@property (nonatomic, strong) UIDatePicker *pickView;

@end

@implementation wjBirthdayTextField

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setUpTextField];
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpTextField];
    }
    return self;
}

- (void)initWithBirthday {
    [self dateChange:self.pickView];
}

- (void)initWithText {
    [self initWithBirthday];
}

// 初始化
- (void)setUpTextField {
    
    UIDatePicker *datePick = [[UIDatePicker alloc] init];
    // 修改datePick日期的模式
    datePick.datePickerMode = UIDatePickerModeDate;
    // 修改日期
    datePick.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    // 监听日期改变----因为没有代理
    [datePick addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    self.inputView = datePick;
    self.pickView = datePick;
    
}

// 日期发生改变就要调用
- (void)dateChange:(UIDatePicker *)datePick {
    NSLog(@"123");
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    // 把当前日期转成字符串
    self.text = [dateFormatter stringFromDate:datePick.date];
}


@end
