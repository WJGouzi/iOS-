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
    
    
    
}

// 移除KVO
- (void)dealloc {
    for (wjShopCarModel *model in _wineArray) {
        [model removeObserver:self forKeyPath:@"count"];
    }
}

#pragma mark - 获取数据源
- (NSArray *)wineArray {
    if (!_wineArray) {
        _wineArray = [wjShopCarModel mj_objectArrayWithFilename:@"wine.plist"];
        
        // 对模型中的count进行监听 ------》》》》》》只要添加到了KVO，会为这个类添加一些子类。。
        for (wjShopCarModel *model in _wineArray) {
            [model addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
        }
    }
    return _wineArray;
}


// KVO的监听
// 自动调用

/**
 * 系统自动调用KVO的监听
 @param keyPath count属性
 @param object 每个不同的模型
 @param change 对比前后不同的值
 */
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    // NSKeyValueChangeNewKey --> new    NSKeyValueChangeOldKey -> old
    int new = [change[NSKeyValueChangeNewKey] intValue];
    int old = [change[NSKeyValueChangeOldKey] intValue];
    wjShopCarModel *model = (wjShopCarModel *)object;
    
    if (new > old) { // 点击的加号
        int totalValue = self.totalPriceLabel.text.intValue + model.money.intValue;
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalValue];
        self.buyBtn.enabled = YES;
        self.clearBtn.enabled = YES;
        
    } else { // 点击的减号
        int totalValue = self.totalPriceLabel.text.intValue - model.money.intValue;
        self.totalPriceLabel.text = [NSString stringWithFormat:@"%d", totalValue];
        if (totalValue == 0) {
            self.buyBtn.enabled = NO;
            self.clearBtn.enabled = NO;
        }
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
