//
//  ViewController.m
//  6-自定义等高cell-xib
//
//  Created by gouzi on 2017/5/8.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjShopCell.h"
#import "wjShopListModel.h"
#import "MJExtension.h"

@interface ViewController () <UITableViewDataSource>
/** 数据源数组*/
@property (nonatomic, strong) NSArray *dataArray;
@end


@implementation ViewController

static NSString *iden = @"cellForSameHeight";
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 70;
//    [self.tableView registerClass:[wjShopListCell class] forCellReuseIdentifier:iden];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([wjShopCell class]) bundle:nil] forCellReuseIdentifier:iden];
}


- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [wjShopListModel mj_objectArrayWithFilename:@"tgs.plist"];
        
    }
    return _dataArray;
}

// 字典转模型




#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    wjShopCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
//    if (!cell) {
//        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([wjShopCell class]) owner:nil options:nil].lastObject;
//    }
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


@end
