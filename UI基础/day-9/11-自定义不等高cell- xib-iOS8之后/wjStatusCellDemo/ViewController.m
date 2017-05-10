//
//  ViewController.m
//  wjStatusCellDemo
//
//  Created by gouzi on 2017/5/10.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjStatusModel.h"
#import "wjStatusCell.h"
#import "MJExtension.h"

@interface ViewController ()


/** 数据源数组*/
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController


- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [wjStatusModel mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _dataArray;
}


static NSString *iden = @"statusCell";
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.rowHeight = 250;
    // cell都是自动设置高度的约束的
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 44;
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([wjStatusCell class]) bundle:nil] forCellReuseIdentifier:iden];
}



#pragma mark - DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    wjStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}







@end
