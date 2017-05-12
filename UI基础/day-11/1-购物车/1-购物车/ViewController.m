//
//  ViewController.m
//  1-购物车
//
//  Created by gouzi on 2017/5/11.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "wjShopCarCell.h"
#import "wjShopCarModel.h"

@interface ViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** wineArray */
@property (nonatomic, strong) NSArray *wineArray;


@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (NSArray *)wineArray {
    if (!_wineArray) {
        _wineArray = [wjShopCarModel mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

static NSString *iden = @"shopCarCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    wjShopCarCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    cell.model = self.wineArray[indexPath.row];
    
    
    return cell;
}



@end
