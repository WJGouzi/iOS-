//
//  wjContactVC.m
//  UIBasicTestDemo
//
//  Created by gouzi on 2017/5/14.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjContactVC.h"

@interface wjContactVC ()


/**
 数据源数组
 */
@property (nonatomic, strong) NSMutableArray *dataArray;



@end

@implementation wjContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self wjNavSettings];
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
        for (int i = 0; i < 30; i++) {
            NSString *text = [NSString stringWithFormat:@"测试联系人数据%d", i];
            [_dataArray addObject:text];
        }
    }
    return _dataArray;
}

#pragma mark - 导航栏的点击事件
- (void)wjNavSettings {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"启动" style:UIBarButtonItemStylePlain target:self action:@selector(start:)];
}

- (void)start:(UIBarButtonItem *)rightItem {
    NSLog(@"click");
    [self.tableView setEditing:!self.tableView.editing animated:YES];
    rightItem.title = self.tableView.editing ? @"还原" : @"启动";
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"contactCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"did selected");
}

// 插入cell

/**
 选择tableView的编辑模式
 UITableViewCellEditingStyleDelete // 删除模式
 UITableViewCellEditingStyleInsert // 插入模式
 UITableViewCellEditingStyleNone   // 无
 */
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleInsert;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleInsert) {
        [tableView beginUpdates];
        // 插入的数据为
        NSString *message = self.dataArray[indexPath.row];
        // 修改数据源
        [self.dataArray insertObject:message atIndex:indexPath.row];
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
        [tableView endUpdates];
    }
}

/**
 *  移动成功后调用
 *  @param sourceIndexPath      原始位置
 *  @param destinationIndexPath 目标位置
 */
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 调用就可以了。
}


@end
