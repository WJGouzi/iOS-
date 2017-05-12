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

@interface ViewController () <UITableViewDataSource, wjShopCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** wineArray */
@property (nonatomic, strong) NSArray *wineArray;


@property (weak, nonatomic) IBOutlet UILabel *totalPriceLabel;

@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;

/** 购买的物品 */
@property (nonatomic, strong) NSMutableArray *wjBuyArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}


#pragma mark - 获取数据源
- (NSArray *)wineArray {
    if (!_wineArray) {
        _wineArray = [wjShopCarModel mj_objectArrayWithFilename:@"wine.plist"];
        
       
    }
    return _wineArray;
}

- (NSMutableArray *)wjBuyArray {
    if (!_wjBuyArray) {
        _wjBuyArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _wjBuyArray;
}


#pragma mark - wjShopCellDelegate
- (void)plusBtnAction:(wjShopCarCell *)cell {
    int totalValue = self.totalPriceLabel.text.intValue + cell.model.money.intValue;
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalValue];
    self.buyBtn.enabled = YES;
    self.clearBtn.enabled = YES;
    
    // 添加到购买的数组
    if (![self.wjBuyArray containsObject:cell.model]) {
        [self.wjBuyArray addObject:cell.model];
    }
}

- (void)minusBtnAction:(wjShopCarCell *)cell {
    int totalValue = self.totalPriceLabel.text.intValue - cell.model.money.intValue;
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalValue];
    if (totalValue == 0) {
        self.buyBtn.enabled = NO;
        self.clearBtn.enabled = NO;
    }
    
    // 移除不需要的物品->只要物品的数量为0的时候，就要从数组中移除
    if (cell.model.count == 0) {
        [self.wjBuyArray removeObject:cell.model];
    }
}



#pragma mark - 按钮的点击事件
- (IBAction)clearShopCar {
    
    // 拿到模型
    for (wjShopCarModel *model in self.wineArray) {
        model.count = 0;
    }
    // 刷新tableView
    [self.tableView reloadData];
    self.totalPriceLabel.text = @"0";
    [self.wjBuyArray removeAllObjects];
    self.clearBtn.enabled = NO;
    self.buyBtn.enabled = NO;
}

- (IBAction)buyProduct {
    // 打印购买了写什么东西
    // 这里的数组一定是有值的，不会遍历所有的数据了
    for (wjShopCarModel *model in self.wjBuyArray) {
        NSLog(@"够了%d瓶%@牌的酒", model.count, model.name);

    }
    
    NSLog(@"总价为:%@",self.totalPriceLabel.text);
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.wineArray.count;
}

static NSString *iden = @"shopCarCell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    wjShopCarCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    cell.model = self.wineArray[indexPath.row];
    cell.wjDelegate = self;
    
    return cell;
}





@end
