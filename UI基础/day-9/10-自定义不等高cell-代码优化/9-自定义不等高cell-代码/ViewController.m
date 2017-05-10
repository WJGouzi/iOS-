//
//  ViewController.m
//  9-自定义不等高cell-代码
//
//  Created by gouzi on 2017/5/9.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjStatusCell.h"
#import "wjStatusModel.h"
#import "MJExtension.h"

@interface ViewController ()


@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

static NSString *iden = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.rowHeight = 250;
    [self.tableView registerClass:[wjStatusCell class] forCellReuseIdentifier:iden];
    
    
}


- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [wjStatusModel mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _dataArray;
}


#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    wjStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - delegate
// 这调用这个方法之前就要算好每个cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    wjStatusCell *cell = [tableView cellForRowAtIndexPath:indexPath];  // 产生死循环 拿不到cell
    wjStatusModel *model = self.dataArray[indexPath.row];
    return model.cellHeight;
}





@end
