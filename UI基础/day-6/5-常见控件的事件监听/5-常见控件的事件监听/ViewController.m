//
//  ViewController.m
//  5-常见控件的事件监听
//
//  Created by gouzi on 2017/3/22.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate, UITextFieldDelegate>

/** 文本输入框 */
@property (nonatomic, strong) UITextField *textField;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 只能用addTarget: 方法
    [self btnSettings];
    
    // 只能用代理的方式
    [self scrollViewSettings];
    
    // 只能用addTarget: 但是需要注意到event事件是有区别的
    [self segmentControlSettings];
    
    // 可以用代理方式或者是addTarget:的方式进行监听(但是event事件是特殊的)
    [self textFieldSettings];
}

#pragma mark - 基本设置
- (void)textFieldSettings {
    // 4.UITextField
    UITextField *textField = [[UITextField alloc] init];
    textField.frame = CGRectMake(50, 100, 100, 30);
    textField.backgroundColor = [UIColor lightGrayColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:textField];
    // 代理方式进行监听
    textField.delegate = self;
    
    // 利用 addTarget: 进行监听
    /*
     UIControlEventEditingDidBegin
     UIControlEventEditingChanged
     UIControlEventEditingDidEnd
     UIControlEventEditingDidEndOnExit
     */
    [textField addTarget:self action:@selector(textFieldClick:) forControlEvents:UIControlEventEditingDidBegin];
    self.textField = textField;
}

- (void)segmentControlSettings {
    // 3.UISegmentedControl
    UISegmentedControl *segment = [[UISegmentedControl alloc] initWithItems:@[@"124312", @"asdas", @"asd"]];
    segment.center = CGPointMake(self.view.center.x, 50);
    segment.selectedSegmentIndex = 2; // 默认选中的是第二个
    [self.view addSubview:segment];
    // 值改变
    [segment addTarget:self action:@selector(segmetClick:) forControlEvents:UIControlEventValueChanged];
}

- (void)scrollViewSettings {
    // 2.UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.delegate = self;
}

- (void)btnSettings {
    // 1.UIButton
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    // 只有一个控件继承于UIControl的时候才能使用 addTarget:
}



#pragma mark - UITextFieldDelegate
- (void)textFieldDidBeginEditing:(UITextField *)textField {
    NSLog(@"开始编辑");
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSLog(@"结束编辑");
}


/**
 当textField的文字发生改变的时候就会调用代理方法
 @param string 用户输入的文字
 @return YES:表示允许用户进行输入   NO:表示禁止用户进行输入
 */
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSLog(@"shouldChangeCharactersInRange----%@", string);
    if ([string isEqualToString:@"x"]) {
        return NO;
    }
    return YES;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 退出键盘
//    [self.textField endEditing:YES];
//    [self.textField resignFirstResponder];
    // 拿到父控件 直接退出键盘
    [self.view endEditing:YES];
}


#pragma mark - 一些点击事件
// btn
- (void)click:(UIButton *)btn {
    NSLog(@"%s", __func__);
}

// segment
- (void)segmetClick:(UISegmentedControl *) segment{
    NSLog(@"%s", __func__);
}



// textField
- (void)textFieldClick:(UITextField *)textField {
    NSLog(@"%s", __func__);
}


@end
