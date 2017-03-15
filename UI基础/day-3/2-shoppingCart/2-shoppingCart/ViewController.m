//
//  ViewController.m
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/15.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/* 购物车*/
@property (weak, nonatomic) IBOutlet UIView *shopCarView;

/* 全局下标*/
//@property (nonatomic, assign) NSInteger index;

/* 添加按钮*/
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
/* 删除按钮*/
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.index = 0;

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
    
    
    
    // 创建商品view
    UIView *shopView = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    shopView.backgroundColor = [UIColor orangeColor];
    [self.shopCarView addSubview:shopView];
    self.removeBtn.enabled = YES;
//    self.index += 1;
    
    if (index == 7) {
        btn.enabled = NO;
    }
}

/* 移除购物车*/
- (IBAction)removeShopping:(UIButton *)btn {
    // 删除最后一个商品
    [self.shopCarView.subviews.lastObject removeFromSuperview];
//    self.index -= 1;
    if (self.shopCarView.subviews.count == 0) {
        btn.enabled = NO;
    }
    self.addBtn.enabled = YES;
    
}


@end
