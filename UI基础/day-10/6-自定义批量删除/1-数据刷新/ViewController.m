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

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** wine */
@property (nonatomic, strong) NSMutableArray *wineArray;

/** 选择的cell的index */
@property (nonatomic, strong) NSMutableArray *selectedIndexPathArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (NSMutableArray *)selectedIndexPathArray {
    if (!_selectedIndexPathArray) {
        _selectedIndexPathArray = [NSMutableArray array];
    }
    return _selectedIndexPathArray;
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

#pragma mark - delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    wjWineModel *model = self.wineArray[indexPath.row];
    if (model.isChecked) {
        model.checked = NO;
        [self.selectedIndexPathArray removeObject:indexPath];
    } else {
        model.checked = YES;
        [self.selectedIndexPathArray addObject:indexPath];
    }
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - 按钮的点击事件
- (IBAction)deleteCellAction:(UIButton *)sender {

    NSMutableArray *deleteModelArray = [NSMutableArray array];
    for (NSIndexPath *index in self.selectedIndexPathArray) {
        [deleteModelArray addObject:self.wineArray[index.row]];
    }
    [self.wineArray removeObjectsInArray:deleteModelArray];
    [self.tableView deleteRowsAtIndexPaths:self.selectedIndexPathArray withRowAnimation:UITableViewRowAnimationFade];
    [self.selectedIndexPathArray removeAllObjects];
}

@end
