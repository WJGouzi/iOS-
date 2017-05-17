//
//  wjContactVC.m
//  2-通讯录
//
//  Created by gouzi on 2017/5/16.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjContactVC.h"
#import "wjAddContactVC.h"
#import "wjContactModel.h"
#import "wjEditContactVC.h"

@interface wjContactVC () <wjAddContactVCDelegate>

/** 数据源数组 */
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation wjContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"%@的通讯录", self.titleText];
}


- (NSMutableArray *)dataArray {

    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}



#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
//    if (!cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
//    }
    wjContactModel *model = self.dataArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.detailTextLabel.text = model.phoneNumber;
    return cell;
}

#pragma mark - 点击事件
- (IBAction)wjLoginOutAction:(UIBarButtonItem *)sender {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定要推出吗?" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    
    [alert addAction:sure];
    [alert addAction:cancel];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.destinationViewController isKindOfClass:[wjAddContactVC class]]) {
        wjAddContactVC *addContact = (wjAddContactVC *)segue.destinationViewController;
        addContact.delegate = self;
    }
    if ([segue.destinationViewController isKindOfClass:[wjEditContactVC class]]) {
        wjEditContactVC *editVC = (wjEditContactVC *)segue.destinationViewController;
        // 这里设置背景颜色的时候，editVC就创建好了，在传值的过程中，editVC的子控件也就已经布局完成，传值也可以展示。
        // 由于控件器的创建都是采用的懒加载的模式，所以不进行设置的页面背景颜色的话，就不会创建，因此这里现行创建，其子控件也能进行创建出来，也可以在模型的setter方法中进行调用。
//        editVC.view.backgroundColor = [UIColor whiteColor];
        NSIndexPath *selectedIndex = [self.tableView indexPathForSelectedRow];
        __block typeof(self) weakSelf = self;
        editVC.block = ^(wjContactModel *model) {
            // block回调进行设置
            [weakSelf.dataArray replaceObjectAtIndex:selectedIndex.row withObject:model];
            
            [weakSelf.tableView reloadRowsAtIndexPaths:@[selectedIndex] withRowAnimation:UITableViewRowAnimationFade];
        };
        // 这里虽然用到的editVC控制器，但是依然不会创建。
        editVC.model = self.dataArray[selectedIndex.row];
    }
    
}

- (void)addContactVC:(wjAddContactVC *)vc model:(wjContactModel *)model {
    
    [self.dataArray insertObject:model atIndex:0];
    NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[index] withRowAnimation:UITableViewRowAnimationFade];
}







@end
