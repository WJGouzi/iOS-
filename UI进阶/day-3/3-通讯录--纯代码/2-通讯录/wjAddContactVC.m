//
//  wjAddContactVC.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjAddContactVC.h"
#import "wjContactModel.h"

@interface wjAddContactVC ()
@property (weak, nonatomic) IBOutlet UITextField *wjNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *wjPhoneTextField;

@property (weak, nonatomic) IBOutlet UIButton *wjAddBtn;
@end

@implementation wjAddContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.wjNameTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [self.wjPhoneTextField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    self.wjPhoneTextField.keyboardType = UIKeyboardTypeNumberPad;
    [self textChange];
}

- (void)textChange {
    self.wjAddBtn.enabled = self.wjNameTextField.text.length && self.wjPhoneTextField.text.length;
}



- (IBAction)wjAddBtnClickAction:(UIButton *)sender {
    wjContactModel *model = [wjContactModel modelWithName:self.wjNameTextField.text phoneNumber:self.wjPhoneTextField.text];
    
    
    if ([self.delegate respondsToSelector:@selector(addContactVC: model:)]) {
        [self.delegate addContactVC:self model:model];
    }
    [self.navigationController popViewControllerAnimated:YES];
}



@end
