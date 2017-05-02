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


- (NSArray *)carsDataGroups {
    if (!_carsDataGroups) {
        wjCarGroup *germany = [[wjCarGroup alloc] init];
        germany.headerStr = @"germany";
        germany.footerStr = @"germany is cool";
//        germany.carArray = @[@{@"name":@"benz",
//                               @"icon":@"m_2_100"},
//                             @{@"name":@"BMW",
//                               @"icon":@"m_3_100"}];
        germany.carArray = @[
                             [wjCar carWithName:@"benz" icon:@"m_2_100"],
                             [wjCar carWithName:@"BMW" icon:@"m_3_100"]
                             ];
        
        wjCarGroup *janpan = [[wjCarGroup alloc] init];
        janpan.headerStr = @"Janpan";
        janpan.footerStr = @"Janpan is worst nation";
        janpan.carArray = @[
                            [wjCar carWithName:@"toyota" icon:@"m_7_100"],
                            [wjCar carWithName:@"mazda" icon:@"m_18_100"],
                            [wjCar carWithName:@"honda" icon:@"m_26_100"]
                            ];
        
        _carsDataGroups = @[germany, janpan];
        
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
