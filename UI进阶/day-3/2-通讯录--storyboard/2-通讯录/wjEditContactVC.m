//
//  wjEditContactVC.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjEditContactVC.h"
#import "wjContactModel.h"

@interface wjEditContactVC ()
@property (weak, nonatomic) IBOutlet UITextField *wjNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *wjPhoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *wjSaveBtn;

@end

@implementation wjEditContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 前提是之前就没有用创建本个控制器
    self.wjNameTextField.text = self.model.name;
    self.wjPhoneTextField.text = self.model.phoneNumber;
}


// 如果在传值之前没有进行设置view的背景颜色，那么当前控制器的子控件还没创建，所以在set model的方法中，虽然有值，但是不能展示出来。
// 如果在传值之前，不在contactVC中进行设置editVC的背景颜色，就不能创建子控件，所以就要等到页面加载完成进行设置数据，也就是在viewDidLoad中进行设置
- (void)setModel:(wjContactModel *)model {
    _model = model;
    /*
    self.wjNameTextField.text = model.name;
    self.wjPhoneTextField.text = model.phoneNumber;
     */
}

- (IBAction)editBtnClickAction:(UIBarButtonItem *)editBtn {
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
    // 修改模型
    self.model.name = self.wjNameTextField.text;
    self.model.phoneNumber = self.wjPhoneTextField.text;    
    self.block(self.model);

    [self.navigationController popViewControllerAnimated:YES];
}


@end
