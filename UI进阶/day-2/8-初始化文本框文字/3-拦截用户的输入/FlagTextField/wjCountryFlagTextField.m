//
//  wjFlagTextField.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjCountryFlagTextField.h"
#import "wjCountryFlagModel.h"
#import "wjCountryFlagView.h"

@interface wjCountryFlagTextField () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) NSArray *dataArray;

/** pickView*/
@property (nonatomic, strong) UIPickerView *pickView;

@end

@implementation wjCountryFlagTextField


- (NSArray *)dataArray {
    if (!_dataArray) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"flags.plist" ofType:nil]];
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            wjCountryFlagModel *model = [wjCountryFlagModel modelWithDict:dict];
            [modelArray addObject:model];
        }
        _dataArray = [modelArray copy];
    }
    return _dataArray;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // 初始化文本框
    [self setUpTextField];
}


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setUpTextField];
    }
    return self;
}

- (void)initWithText {
    [self pickerView:self.pickView didSelectRow:0 inComponent:0];
}




- (void)setUpTextField {
    // 创建pickView
    UIPickerView *pickView = [[UIPickerView alloc] init];
    pickView.delegate = self;
    pickView.dataSource = self;
    
    // 修改文本框弹出键盘的类型
    self.inputView = pickView;
    self.pickView = pickView;
}

#pragma mark - UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArray.count;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view {
    wjCountryFlagView *countryFlagView = [wjCountryFlagView countryFlagView];
    countryFlagView.model = self.dataArray[row];
    return countryFlagView;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 80;
}

// 把当前选中的展示到文本框中
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    wjCountryFlagModel *model = self.dataArray[row];
    self.text = model.name;
}


@end
