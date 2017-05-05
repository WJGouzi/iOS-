//
//  ViewController.m
//  5-展示单组数据
//
//  Created by gouzi on 2017/5/5.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjWineModel.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 数据源数组 */
@property (nonatomic, strong) NSArray *wineArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource = self;
}

- (NSArray *)wineArray {
    if (!_wineArray) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"wine" ofType:@"plist"]];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary *wineDict in dictArray) {
            [tempArray addObject:[wjWineModel wineWithDict:wineDict]];
        }
        _wineArray = [tempArray copy];
    }
    return _wineArray;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *iden = @"iden";
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:iden];
    if (!cell) {
        cell = [tableView dequeueReusableCellWithIdentifier:iden];
    }
    wjWineModel *model = self.wineArray[indexPath.row];
    cell.textLabel.text = model.name;
    cell.imageView.image = [UIImage imageNamed:model.icon];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"￥%@", model.price];
    cell.detailTextLabel.textColor = [UIColor orangeColor];
    return cell;
}

@end
