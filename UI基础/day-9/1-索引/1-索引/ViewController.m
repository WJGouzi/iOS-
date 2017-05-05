//
//  ViewController.m
//  1-索引
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjCarGroup.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置索引条的文字颜色
    self.tableView.sectionIndexColor = [UIColor redColor];
    
    // 设置索引条的背景颜色
    self.tableView.sectionIndexBackgroundColor = [UIColor clearColor];
}


- (NSArray *)dataArray {
    if (!_dataArray) {
        
        NSArray *array = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"cars" ofType:@"plist"]];
        NSMutableArray *temp = [NSMutableArray array];
        for (NSDictionary *dict in array) {
            wjCarGroup *carGroup = [wjCarGroup carGroupWithDict:dict];
            [temp addObject:carGroup];
        }
        
        _dataArray = [temp copy];
    }
    return _dataArray;
}

#pragma mark - dataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    wjCarGroup *carGroup = self.dataArray[section];
    return carGroup.cars.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"iden";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iden];
    }
    wjCarGroup *carGroup = self.dataArray[indexPath.section];
    wjCar *car = carGroup.cars[indexPath.row];
    cell.textLabel.text = car.name;
    cell.imageView.image = [UIImage imageNamed:car.icon];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    wjCarGroup *group = self.dataArray[section];
    return group.title;
}

// 加入索引条
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.dataArray valueForKey:@"title"];
}


@end
