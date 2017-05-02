//
//  ViewController.m
//  2-展示汽车数据
//
//  Created by gouzi on 2017/5/2.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    if (section == 1) {
        return 3;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"benz";
            cell.imageView.image = [UIImage imageNamed:@"m_2_100"];
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"BMW";
            cell.imageView.image = [UIImage imageNamed:@"m_3_100"];
        }
    } else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"toyota";
            cell.imageView.image = [UIImage imageNamed:@"m_7_100"];
        }
        if (indexPath.row == 1) {
            cell.textLabel.text = @"mazda";
            cell.imageView.image = [UIImage imageNamed:@"m_18_100"];
        }
        if (indexPath.row == 2) {
            cell.textLabel.text = @"honda";
            cell.imageView.image = [UIImage imageNamed:@"m_26_100"];
        }
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator; // 设置右边的指示样式
    // accessoryView 优先级大于 accessoryType
//    cell.accessoryView = [[UISwitch alloc] init]; // 设置右边的为开关
    return cell;
}



/**
 告诉每一组的头部显示什么数据
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return @"Germany is awsome";
    } else if (section == 1) {
        return @"Janpan is worst nation";
    }
    return nil;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Germany";
    } else if (section == 1) {
        return @"Janpan";
    }
    return nil;
}


@end
