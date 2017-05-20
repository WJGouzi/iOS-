//
//  wjContactViewController.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/17.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjContactViewController.h"
#import "wjAddContactViewController.h"
#import "wjEditContactViewController.h"
#import "wjContactModel.h"

@interface wjContactViewController () <wjAddContactListDelegate>

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation wjContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self navigationItemSettings];
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)navigationItemSettings {
    self.title = [NSString stringWithFormat:@"%@的通讯录", self.titleText];
    UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    [addBtn sizeToFit];
    [addBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addBtnClickAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:addBtn];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"注销" style:UIBarButtonItemStylePlain target:self action:@selector(loginOut)];
    
}

- (void)addBtnClickAction:(UIButton *)btn {
    wjAddContactViewController *addContactVC = [[wjAddContactViewController alloc] init];
    addContactVC.delegate = self;
    [self.navigationController pushViewController:addContactVC animated:YES];
}

- (void)addContactListWithViewController:(wjAddContactViewController *)addContactVC model:(wjContactModel *)model {
    [self.dataArray insertObject:model atIndex:0];
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
}



- (void)loginOut {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定要推出吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    [alert addAction:sure];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *idenStr = @"cells";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenStr];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:idenStr];
    }
    wjContactModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.phoneNumber;
    return cell;
}

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    wjEditContactViewController *editVC = [[wjEditContactViewController alloc] init];
    __block typeof(self) weakSelf = self;
    editVC.block = ^(wjContactModel *model) {
        [weakSelf.dataArray replaceObjectAtIndex:indexPath.row withObject:model];
        [weakSelf.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    };
    editVC.model = self.dataArray[indexPath.row];
    [self.navigationController pushViewController:editVC animated:YES];
    
}



@end
