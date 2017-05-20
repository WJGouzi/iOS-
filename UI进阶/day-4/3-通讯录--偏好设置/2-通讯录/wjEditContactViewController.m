//
//  wjEditContactViewController.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjEditContactViewController.h"
#import "wjContactModel.h"

@interface wjEditContactViewController ()

@property (weak, nonatomic) IBOutlet UITextField *wjNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *wjPhoneTextField;

@property (weak, nonatomic) IBOutlet UIButton *wjSaveBtn;
@end

@implementation wjEditContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self navigationItemSettings];
    
    self.wjNameTextField.text = self.model.name;
    self.wjPhoneTextField.text = self.model.phoneNumber;
    
}

- (void)navigationItemSettings {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(editClick:)];
    
}

- (void)editClick:(UIBarButtonItem *)editBtn {
    BOOL isEdit = [editBtn.title isEqualToString:@"编辑"];
    self.wjPhoneTextField.enabled = isEdit;
    self.wjNameTextField.enabled = isEdit;
    if (isEdit) {
        [self.wjPhoneTextField becomeFirstResponder];
    } else {
        [self.view endEditing:YES];
    }
    self.wjSaveBtn.hidden = !isEdit;
    editBtn.title = isEdit ? @"取消" : @"编辑";
}

- (IBAction)wjSaveBtnClickAction:(UIButton *)sender {
    self.model.name = self.wjNameTextField.text;
    self.model.phoneNumber = self.wjPhoneTextField.text;
    self.block(self.model);
    [self.navigationController popViewControllerAnimated:YES];
}

@end
