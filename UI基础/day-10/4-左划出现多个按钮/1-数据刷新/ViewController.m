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
 * 左划出现的delete按钮，点击的时候会调用这个方法(系统默认的delete按钮才会监听)
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



/**
 这个方法调用后，上面那个方法`titleForDeleteConfirmationButtonForRowAtIndexPath`就不会被调用。
 且`commitEditingStyle: forRowAtIndexPath: `这个方法在默认的action按钮被修改的时候也不会进行调用
 */
- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    //
    self.tableView.editing = YES;
    // 关注按钮
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"关注" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        action.title = @"已关注";
//        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight]; // 动画效果不好
        NSLog(@"1232");
        
        self.tableView.editing = NO; // 左划出现按钮的时候，点击很顺畅进行滑动小时
        
    }];
    
    action.backgroundColor = [UIColor lightGrayColor];

    // 删除按钮
    UITableViewRowAction *delete = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        if (self.wineArray.count > 0) {
            // 删除模型
            [self.wineArray removeObjectAtIndex:indexPath.row];
            // 局部刷新
            [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
        
    }];
    delete.backgroundColor = [UIColor redColor];
    return @[delete, action];
    
}


#pragma mark - 按钮的点击事件
- (IBAction)deleteCellAction:(UIButton *)sender {
    
    // 没有动画的进入编辑模式
//    self.tableView.editing = !self.tableView.editing; // 和左划操作是一样的、、 进入编辑模式
    // 有动画的进入编辑模式
    [self.tableView setEditing:!self.tableView.editing animated:YES];
}



@end
