//
//  wjContactVC.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/16.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjContactVC.h"

@interface wjContactVC ()

@end

@implementation wjContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@的通讯录", self.titleText];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (IBAction)wjLoginOutAction:(UIBarButtonItem *)sender {
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

@end
