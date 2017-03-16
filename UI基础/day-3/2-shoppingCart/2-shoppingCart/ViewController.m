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

/* 全局下标*/ // 不可取
//@property (nonatomic, assign) NSInteger index;

/* 添加按钮*/
@property (weak, nonatomic) IBOutlet UIButton *addBtn;
/* 删除按钮*/
@property (weak, nonatomic) IBOutlet UIButton *removeBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
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
    // 方式一(不可取：数据都是一样的)
    /*
    imageView.image = [UIImage imageNamed:@"danjianbao"];
    nameLabel.text = @"单肩包";
    */
    // 方式二(也不可取:太冗余)
    /**
     if () {
     
     } else {
     
     }
     */
    // 方式三（数组：两个数组之间容易出错，不能形成联系，可能匹配出错）
    /*
    NSArray<NSString *> *imageNames = @[@"danjianbao", @"liantiaobao", @"qianbao", @"shoutibao", @"shuangjianbao", @"xiekuabao", @"shuangjianbao", @"xiekuabao"];
    NSArray<NSString *> *titleNames = @[@"单肩包", @"链条包", @"钱包", @"手提包", @"双肩包", @"斜跨包", @"双肩包", @"斜跨包"];
    imageView.image = [UIImage imageNamed:imageNames[index]];
    nameLabel.text = titleNames[index];
    */
    // 方式四(数组 + 字典)
    NSArray<NSDictionary *> *dataArray = @[
                                           @{@"name":@"单肩包", @"icon":@"danjianbao"},
                                           @{@"name":@"单条包", @"icon":@"liantiaobao"},
                                           @{@"name":@"单钱包", @"icon":@"qianbao"},
                                           @{@"name":@"单肩包", @"icon":@"danjianbao"},
                                           @{@"name":@"单肩包", @"icon":@"danjianbao"},
                                           @{@"name":@"单肩包", @"icon":@"danjianbao"},
                                           @{@"name":@"单肩包", @"icon":@"danjianbao"},
                                           @{@"name":@"单肩包", @"icon":@"danjianbao"}
                                           ];
    NSDictionary *dict = dataArray[index];
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
