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

#pragma mark - delegate

/**
 * 添加左划删除功能----只要实现这个方法就可以拥有左划删除功能
 * 左划出现的delete按钮，点击的时候会调用这个方法
 @param indexPath 滑动的哪一行
 */
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.wineArray.count > 0) {
        // 删除模型
        [self.wineArray removeObjectAtIndex:indexPath.row];
        // 局部刷新
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}


/**
 * 修改默认的delete的文字
 @param indexPath 哪一行的文字需要修改
 */
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}


#pragma mark - 按钮的点击事件
- (IBAction)deleteCellAction:(UIButton *)sender {
    
}



@end
