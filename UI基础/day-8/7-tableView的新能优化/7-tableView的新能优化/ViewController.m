//
//  ViewController.m
//  7-tableView的新能优化
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] init]; // 后面的tableView的分割线就没了。
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:iden];

}


#pragma mark - dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 300;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 不通过缓存池的方法进行创建cell，在cell离开屏幕的时候，就会被销毁掉，然后再重新创建一个新的cell展示->这就频繁的分配内存来进行销毁和创建cell。
    static NSString *iden = @"iden";
    // 根据iden这个标识符，注册对应的cell类型 为UITableViewCell
    // 自动创建。。。。。在去缓存池中取之前进行注册。。。。
    // 每次都会调用，其实只需要调用一次就可以了
//    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:iden];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
        // cell的一次性设置，最好写在这里面。
        // cell不一致的设置的时候，最好不要在这里设置。因为这个方法的调用次数有限。
        cell.backgroundView = [[UIView alloc] init];
    }
    // 有if 就要有 else -> 因为在cell的复用的时候，不能确定上次的复用的是哪个cell，所以要确定每个indexPath的cell的样式
    if (indexPath.row % 2 == 0) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    NSLog(@"%p-------%ld", cell, indexPath.row);
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %ld", indexPath.section, indexPath.row];
    return cell;
}


@end
