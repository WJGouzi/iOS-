//
//  ViewController.m
//  1-展示多组数据
//
//  Created by gouzi on 2017/5/2.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置数据源
    self.tableView.dataSource = self;
}


#pragma mark - UITableViewDataSource

/**
 数据源一共有多少组数据
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}


/**
 告知每个组有多少行
 
 */
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else if (section == 1) {
        return 6;
    } else if (section == 2) {
        return 6;
    } else if (section == 3) {
        return 1;
    }
    return 0;
}


/**
 每一行显示的内容
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0 && indexPath.row == 0) {
        cell.textLabel.text = @"通用";
    }
    return cell;
}

@end
