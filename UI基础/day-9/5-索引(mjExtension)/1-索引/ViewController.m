//
//  ViewController.m
//  1-索引
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjCarGroup.h"
#import "MJExtension.h"

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
        // 告诉MJExtension这个框架wjCarGroup的cars数组属性里面装的是wjCar对象
        [wjCarGroup mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"cars" : [wjCar class]};
        }];
        _dataArray = [[wjCarGroup mj_objectArrayWithFilename:@"cars.plist"] copy];
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
