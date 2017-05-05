//
//  ViewController.m
//  5-展示单组数据
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjWineModel.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 数据源数组 */
@property (nonatomic, strong) NSArray *wineArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    
    // 一些基本属性
//    // cell行高
//    self.tableView.rowHeight = 50;
//    
//    // 每一组的头尾部的高度
//    self.tableView.sectionHeaderHeight = 30;
//    self.tableView.sectionFooterHeight = 30;
//    
//    // 整张表的头部
//    self.tableView.tableHeaderView = [[UISwitch alloc] init];
//    // 整张表的尾部
//    self.tableView.tableFooterView = [[UISwitch alloc] init];
//    
//    // 分割线
//    self.tableView.separatorColor = [UIColor redColor];
//    //    self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched; // 仅支持在group样式下。
}

- (NSArray *)wineArray {
    if (!_wineArray) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine" ofType:@"plist"]];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *wineDict in dictArray) {
            [tempArray addObject:[wjWineModel wineWithDict:wineDict]];
        }
        _wineArray = [tempArray copy];
    }
    return _wineArray;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"iden";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:iden];
    }
    wjWineModel *model = self.wineArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@", model.price];
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    return cell;
}

@end
