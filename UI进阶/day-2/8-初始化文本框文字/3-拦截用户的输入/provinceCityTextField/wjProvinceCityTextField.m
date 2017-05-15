//
//  wjProvinceCityTextField.m
//  3-拦截用户的输入
//
//  Created by gouzi on 2017/5/15.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjProvinceCityTextField.h"
#import "wjProvinceModel.h"

@interface wjProvinceCityTextField () <UIPickerViewDataSource, UIPickerViewDelegate>


/** dataArray*/
@property (nonatomic, strong) NSArray *dataArray;

/* 选择省份的下标*/
@property (nonatomic, assign) NSInteger provinceIndex;

/** pickView*/
@property (nonatomic, strong) UIPickerView *pickView;

@end


@implementation wjProvinceCityTextField

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

- (void)initWithProvinceAndCity {
    [self pickerView:self.pickView didSelectRow:0 inComponent:0];
}

- (void)initWithText {
    [self initWithProvinceAndCity];
}

- (NSArray *)dataArray {
    if (!_dataArray) {
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"provinces" ofType:@"plist"]];
        
        NSMutableArray *provinceArray = [NSMutableArray array];
        for (NSDictionary *province in array) {
            [provinceArray addObject:[wjProvinceModel provinceWithDict:province]];
        }
        _dataArray = [provinceArray copy];
        
    }
    return _dataArray;
}


// 初始化
- (void)setUpTextField {
    UIPickerView *pickView = [[UIPickerView alloc] init];
    pickView.delegate = self;
    pickView.dataSource = self;
    self.inputView = pickView;
    self.pickView = pickView;
}


#pragma maek - UIPickerViewDataSource;
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return self.dataArray.count;
    } else {
        wjProvinceModel *model = self.dataArray[self.provinceIndex];
        NSArray *cityArray = model.cities;
        return cityArray.count;
    }
}


#pragma mark - UIPickerViewDelegate;
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        wjProvinceModel *model = self.dataArray[row];
        return model.name;
    } else {
        wjProvinceModel *model = self.dataArray[self.provinceIndex];
        return model.cities[row];
    }
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0) {
        self.provinceIndex = row;
        [pickerView selectRow:0 inComponent:1 animated:YES];
        [pickerView reloadAllComponents];
    }
    wjProvinceModel *province = self.dataArray[self.provinceIndex];
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    NSString *provinceName = province.name;
    NSString *cityName = province.cities[cityIndex];
    self.text = [NSString stringWithFormat:@"%@-%@", provinceName, cityName];
}


@end
