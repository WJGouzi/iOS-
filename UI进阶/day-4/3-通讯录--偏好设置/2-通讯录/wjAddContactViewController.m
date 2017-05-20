//
//  wjAddContactViewController.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjAddContactViewController.h"
#import "wjContactModel.h"

@interface wjAddContactViewController ()

@property (weak, nonatomic) IBOutlet UITextField *wjNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *wjPhoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *wjAddBtn;
@end

@implementation wjAddContactViewController

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
    
    
    if ([self.delegate respondsToSelector:@selector(addContactListWithViewController: model:)]) {
        [self.delegate addContactListWithViewController:self model:model];
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
