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
    
    // 监听通知 --> 要在发布通知之前就要设置好监听
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(plusClick:) name:@"plusClickNotification" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(minusClick:) name:@"minusClickNotification" object:nil];
    
    
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark - 监听通知
- (void)plusClick:(NSNotification *)notification {
    NSLog(@"click plus");
    wjShopCarCell *cell = notification.object;
    
    int totalPrice = [self.totalPriceLabel.text intValue] + cell.model.money.intValue;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    
}

- (void)minusClick:(NSNotification *)notification {
    NSLog(@"click minus");
    wjShopCarCell *cell = notification.object;
    
    int totalPrice = [self.totalPriceLabel.text intValue] - cell.model.money.intValue;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    
}




#pragma mark - 获取数据源
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
