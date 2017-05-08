//
//  ViewController.m
//  2-展示汽车数据
//
//  Created by gouzi on 2017/5/2.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjCarGroup.h"
#import "wjCar.h"
#import "MJExtension.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 数据源数组 */
@property (nonatomic, strong) NSArray *carsDataGroups;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}

/********************************************************
 1> plist解析:
 以后遇到像这种复杂的plist,一层一层的往下解析.
 最终的目的就是将所有的字典转成模型.
 如果plist中字典在一个数组中,将来转出来的模型也放在一个数组中.
 也就是将字典数组转成模型数组.
 
 2> plist的好处:方便管理数据
 *******************************************************/
// plist
- (NSArray *)carsDataGroups {
    if (!_carsDataGroups) {
        // 1.加载字典数组
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        NSLog(@"dict is %@", dictArray);
        
        // 2.创建模型数组
        NSMutableArray *tempArray = [NSMutableArray array];
        // 3.字典数组->模型数组
        for (NSDictionary *carGroupDict in dictArray) {
            wjCarGroup *group = [wjCarGroup carGroupWithDict:carGroupDict];
            [tempArray addObject:group];
        }
        _carsDataGroups = [tempArray copy];
    }
    return _carsDataGroups;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.carsDataGroups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    wjCarGroup *group = self.carsDataGroups[section];
    return group.carArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    // 取出indexpath的section组模型
    wjCarGroup *group = self.carsDataGroups[indexPath.section];
    // 取出indexpath的车模型
    wjCar *car = group.carArray[indexPath.row];
    // 设置数据
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}



/**
 告诉每一组的头部显示什么数据
 */
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    wjCarGroup *group = self.carsDataGroups[section];
    return group.footerStr;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    wjCarGroup *group = self.carsDataGroups[section];
    return group.headerStr;
}


@end
