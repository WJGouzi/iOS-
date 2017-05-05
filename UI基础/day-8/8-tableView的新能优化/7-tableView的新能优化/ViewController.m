//
//  ViewController.m
//  7-tableView的新能优化
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjTableViewCell.h"

@interface ViewController ()

@end

@implementation ViewController
static NSString *iden = @"iden";
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] init]; // 后面的tableView的分割线就没了。
    // 这里的cell一定存在，而且是注册一次。
    // 设置不了cell的样式，导致cell的detailText显示不出来的，这种注册的方式一般会用到自定义的cell的样式上
    [self.tableView registerClass:[wjTableViewCell class] forCellReuseIdentifier:iden];
}


#pragma mark - dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    wjTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
       if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    NSLog(@"%p-------%ld", cell, indexPath.row);
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
    return cell;
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 这种方式创建的cell会在cell移出屏幕的时候会被销毁掉，然后再重新创建cell
    wjTableViewCell *cell = [[wjTableViewCell alloc] init];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
    return cell;
}
*/
@end
