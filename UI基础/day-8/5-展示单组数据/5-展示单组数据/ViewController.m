//
//  ViewController.m
//  5-展示单组数据
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjWineModel.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 数据源数组 */
@property (nonatomic, strong) NSArray *wineArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
    }
    wjWineModel *model = self.wineArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@", model.price];
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    return cell;
}

#pragma mark - UITableViewDelegate
/**
 *  选中了某一行cell就会调用这个方法
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"选中了:%ld",indexPath.row);
}

/**
 *  取消选中了某一行cell就会调用这个方法
 */
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //     NSLog(@"取消选中了:%ld",indexPath.row);
}

/**
 *  返回每一组显示的头部控件
 */
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return [UIButton buttonWithType:UIButtonTypeContactAdd];
}

/**
 *  返回每一组显示的尾部控件
 */
//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
//{
//
//}

/**
 *  返回每一组的头部高度
 */
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 100;
}

/**
 *  返回每一组的尾部高度
 */
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
//{
//
//}

/**
 *  返回每一行cell的高度
 */
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.row % 2 == 0) {
//        return 100;
//    } else {
//        return 50;
//    }
//}



@end
