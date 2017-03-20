//
//  ViewController.m
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/15.
//  Copyright © 2017年 wangjun. All rights reserved.
//  plist

#import "ViewController.h"
#import "wjShopModel.h"
#import "wjShopView.h"

@interface ViewController ()
/* 购物车*/
@property (weak, nonatomic) IBOutlet UIView *shopCarView;
/* 添加按钮*/
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
/* 删除按钮*/
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;

/** 数据源数组 */
@property (nonatomic, strong) NSArray *dataArray;

/* 提醒文字*/
@property (weak, nonatomic) IBOutlet UILabel *showNoticeLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - 懒加载
-(NSArray *)dataArray {
    if (!_dataArray) {
        // 加载数据
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"shopData" ofType:@"plist"];
        _dataArray = [NSArray arrayWithContentsOfFile:dataPath];
        
        // 字典转模型
        NSMutableArray *tempArray = [NSMutableArray arrayWithCapacity:0];
        for (NSDictionary *dict in _dataArray) {
             wjShopModel *shopModel = [wjShopModel shopWithShopDict:dict];
            [tempArray addObject:shopModel];
        }
        _dataArray = tempArray;
    }
    return _dataArray;
}


/* 添加到购物车*/
- (IBAction)addShopping:(UIButton *)btn {
    
    //
    NSInteger allCols = 4;
    NSInteger allRanks = 2;
    CGFloat width = 80;
    CGFloat height = 100;
    CGFloat marginH = (self.shopCarView.frame.size.width - allCols * width) / (allCols - 1);
    CGFloat marginV = (self.shopCarView.frame.size.height - allRanks * height) / (allRanks - 1);
    // 设置索引
    NSInteger index = self.shopCarView.subviews.count;
    
    CGFloat x = (marginH + width) * (index % allCols);
    CGFloat y = (marginV + height) * (index / allCols);
    
    // 设置数据
    wjShopView *shopView = [wjShopView shopView];
    shopView.frame = CGRectMake(x, y, width, height);
    shopView.shopModel = self.dataArray[index];
    [self.shopCarView addSubview:shopView];

    
    self.removeBtn.enabled = YES;
    if (index == 7) {
        btn.enabled = NO;
        [self showWithInfo:@"当前购物车已满了！"];
    }
}

/* 移除购物车*/
- (IBAction)removeShopping:(UIButton *)btn {
    // 删除最后一个商品
    [self.shopCarView.subviews.lastObject removeFromSuperview];
    if (self.shopCarView.subviews.count == 0) {
        btn.enabled = NO;
        [self showWithInfo:@"购物车已经清空了！"];
    }
    self.addBtn.enabled = YES;
    
}



- (void)showWithInfo:(NSString *)info {
    
    [UIView animateWithDuration:1.0f animations:^{
        self.showNoticeLabel.text = info;
        self.showNoticeLabel.alpha = 1.0f;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:1.0f animations:^{
            self.showNoticeLabel.alpha = 0.f;
        }];
    }];
    
}





@end
