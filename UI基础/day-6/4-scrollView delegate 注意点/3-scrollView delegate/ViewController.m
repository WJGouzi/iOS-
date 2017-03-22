//
//  ViewController.m
//  3-scrollView delegate
//
//  Created by gouzi on 2017/3/22.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import "wjCar.h"

@interface ViewController ()

/** 车*/
@property (nonatomic, strong) wjCar *car;

@end

@implementation ViewController

/*
 *  1.任何OC对象都可以成为scrollView的代理
 *  2.苹果设计的代理属性为啥是weak
 */

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 基本设置
    [self scrollViewBasicSettings];
    
}


#pragma mark- scrollView的基本设置
- (void)scrollViewBasicSettings {
    // scrollView
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375, 667)];
    scrollView.backgroundColor = [UIColor lightTextColor];
    [self.view addSubview:scrollView];
    // 通过代码创建scrollView的时候，一开始subviews数组为空
    NSLog(@"subviews is : %@", scrollView.subviews);
    
    // 图片
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [scrollView addSubview:imageView];
    NSLog(@"subviews is : %@", scrollView.subviews);
    
    scrollView.contentSize = image.size;
    
    // delegate
    self.car = [[wjCar alloc] init];
    scrollView.delegate = self.car;
}




@end
