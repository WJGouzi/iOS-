//
//  ViewController.m
//  2-自定义等高cell-纯代码
//
//  Created by gouzi on 2017/5/8.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjShopListCell.h"
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
    [self.tableView registerClass:[wjShopListCell class] forCellReuseIdentifier:iden];
    
}


- (NSArray *)dataArray {
    if (!_dataArray) {
        NSArray *dictArray = [[NSArray alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"]]; // 假如这个数据源是从网络上加载的，也可以使用下面的方法进行设置
        _dataArray = [[wjShopListModel mj_objectArrayWithKeyValuesArray:dictArray] copy];
//        NSMutableArray *tempArray = [NSMutableArray array];
//        for (NSDictionary *shopDict  in dictArray) {
//            [tempArray addObject:[wjShopListModel shopListWithDict:shopDict]];
//        }
//        _dataArray = [tempArray copy];
        
        // 简单的方法
//        _dataArray = [[wjShopListModel mj_objectArrayWithFile:[[NSBundle mainBundle] pathForResource:@"tgs" ofType:@"plist"]] copy];
//        _dataArray = [[wjShopListModel mj_objectArrayWithFilename:@"tgs.plist"] copy];
        
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
    wjShopListCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}

@end
