//
//  ViewController.m
//  2-shoppingCart
//
//  Created by gouzi on 2017/3/15.
//  Copyright © 2017年 wangjun. All rights reserved.
//  plist

#import "ViewController.h"

@interface ViewController ()
/* 购物车*/
@property (weak, nonatomic) IBOutlet UIView *shopCarView;

/* 全局下标*/ // 不可取
//@property (nonatomic, assign) NSInteger index;

/* 添加按钮*/
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
/* 删除按钮*/
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;

/** 数据源数组 */
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


#pragma mark - 懒加载
/*
- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = @[
                       @{@"name":@"单肩包", @"icon":@"danjianbao"},
                       @{@"name":@"单条包", @"icon":@"liantiaobao"},
                       @{@"name":@"单钱包", @"icon":@"qianbao"},
                       @{@"name":@"单肩包", @"icon":@"danjianbao"},
                       @{@"name":@"单肩包", @"icon":@"danjianbao"},
                       @{@"name":@"单肩包", @"icon":@"danjianbao"},
                       @{@"name":@"单肩包", @"icon":@"danjianbao"},
                       @{@"name":@"单肩包", @"icon":@"danjianbao"}
                       ];
    }
    return _dataArray;
}
*/
-(NSArray *)dataArray {
    if (!_dataArray) {
        // 加载数据
        NSString *dataPath = [[NSBundle mainBundle] pathForResource:@"shopData" ofType:@"plist"];
        _dataArray = [NSArray arrayWithContentsOfFile:dataPath];
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
    
    
    
    // 创建商品view视图
    UIView *shopView = [[UIView alloc] initWithFrame:CGRectMake(x, y, width, height)];
    shopView.backgroundColor = [UIColor orangeColor];
    [self.shopCarView addSubview:shopView];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.frame = CGRectMake(0, 0, width, width);
    imageView.backgroundColor = [UIColor blueColor];
    [shopView addSubview:imageView];
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, width, width, height - width)];
    nameLabel.textAlignment = NSTextAlignmentCenter;
    nameLabel.backgroundColor = [UIColor yellowColor];
    [shopView addSubview:nameLabel];
    
    // 设置数据
    // 方式四(数组 + 字典)
    NSDictionary *dict = self.dataArray[index];
    imageView.image = [UIImage imageNamed:dict[@"icon"]];
    nameLabel.text = dict[@"name"];
    
    self.removeBtn.enabled = YES;
    if (index == 7) {
        btn.enabled = NO;
    }
}

/* 移除购物车*/
- (IBAction)removeShopping:(UIButton *)btn {
    // 删除最后一个商品
    [self.shopCarView.subviews.lastObject removeFromSuperview];
    if (self.shopCarView.subviews.count == 0) {
        btn.enabled = NO;
    }
    self.addBtn.enabled = YES;
    
}


@end
