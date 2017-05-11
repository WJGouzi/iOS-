//
//  ViewController.m
//  1-数据刷新
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjWineModel.h"
#import "wjWineCell.h"
#import "MJExtension.h"

@interface ViewController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** wine */
@property (nonatomic, strong) NSMutableArray *wineArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSMutableArray *)wineArray {
    if (!_wineArray) {
        _wineArray = [wjWineModel mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}


#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"wineCell";
    wjWineCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    
    if (!cell) {
        cell = [[wjWineCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
    }
    
    cell.model = self.wineArray[indexPath.row];
    
    return cell;
}



#pragma mark - 按钮的点击事件
#pragma mark -- 需要增删修改cell上的数据，一般就通过修改模型中的数据，进行修改，然后重新刷新tableView
- (IBAction)addCellAction:(UIButton *)sender {
    // 添加到数据源
    wjWineModel *model = [[wjWineModel alloc] init];
    model.name = @"女儿红";
    model.money = @"55.5";
    model.image = @"newWine";
//    [self.wineArray addObject:model]; // 添加到最后一个
    [self.wineArray insertObject:model atIndex:0]; // 添加到第一个
//    [self.tableView reloadData]; // 刷新表格
    // 局部刷新
    NSArray *indexPaths = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    // 插入一行
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
}

- (IBAction)deleteCellAction:(UIButton *)sender {
    // 修改模型
    if (self.wineArray.count > 0) {
        // 一次性删除两个
        [self.wineArray removeObjectAtIndex:0];
        [self.wineArray removeObjectAtIndex:0];
//        [self.tableView reloadData];
        // 局部刷新
        NSArray *indexPaths = @[
                                [NSIndexPath indexPathForRow:0 inSection:0],
                                [NSIndexPath indexPathForRow:1 inSection:0],
                                ];
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
    } else {
        return;
    }
}

- (IBAction)updateCellAction:(UIButton *)sender {
    // 修改模型
    // 如果修改cell的话 在循环利用的时候会被修改掉
    wjWineModel *model = self.wineArray[0];
    model.money = @"100";
//    [self.tableView reloadData]; // 全局刷新,,所有的cell都会被刷新
    
    // 局部刷新
    NSArray *indexPaths = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade]; // 使用前提必须保证cell的个数不能改变
}


@end
