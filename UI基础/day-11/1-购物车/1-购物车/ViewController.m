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

@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UIButton *clearBtn;

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


#pragma mark - 获取数据源
- (NSArray *)wineArray {
    if (!_wineArray) {
        _wineArray = [wjShopCarModel mj_objectArrayWithFilename:@"wine.plist"];
    }
    return _wineArray;
}




#pragma mark - 监听通知
- (void)plusClick:(NSNotification *)notification {
    wjShopCarCell *cell = notification.object;
    
    int totalPrice = [self.totalPriceLabel.text intValue] + cell.model.money.intValue;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    
    self.buyBtn.enabled = YES;
    self.clearBtn.enabled = YES;
}

- (void)minusClick:(NSNotification *)notification {
    wjShopCarCell *cell = notification.object;
    
    int totalPrice = [self.totalPriceLabel.text intValue] - cell.model.money.intValue;
    
    self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalPrice];
    
    if (totalPrice == 0) {
        self.buyBtn.enabled = NO;
        self.clearBtn.enabled = NO;
    }
    
}



#pragma mark - 按钮的点击事件
- (IBAction)clearShopCar {
    self.totalPriceLabel.text = @"0";
    
    // 拿到模型
    for (wjShopCarModel *model in self.wineArray) {
        model.count = 0;
    }
    // 刷新tableView
    [self.tableView reloadData];
    self.clearBtn.enabled = NO;
    self.buyBtn.enabled = NO;
}

- (IBAction)buyProduct {
    // 打印购买了写什么东西
    for (wjShopCarModel *model in self.wineArray) { // 性能有问题的
        if (model.count) {
            NSLog(@"够了%d瓶%@牌的酒", model.count, model.name);
        }
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
    
    
    return cell;
}





@end
