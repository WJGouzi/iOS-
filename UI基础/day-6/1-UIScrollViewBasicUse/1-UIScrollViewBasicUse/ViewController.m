//
//  ViewController.m
//  1-UIScrollViewBasicUse
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.frame = CGRectMake(0, 0, 50, 50);
    [self.scrollView addSubview:redView];
    
    // 给用户进行交互
    self.scrollView.userInteractionEnabled = YES; // 设置成NO后，内部所有的交互都被禁止掉，内部所有的子控件的交互也被禁止掉了
    
    // 是否能够滚动
    self.scrollView.scrollEnabled = YES; // 默认情况下是YES
    
    // 默认scrollView设置了该属性为YES
//    self.scrollView.clipsToBounds = YES;
    // 设置内容尺寸(滚动的尺寸)
    // 可滚动的尺寸:(contentSize - scrollViewSize)
    // 注意点 : contentSize <= scrollViewSize 是不可以滚动的
    self.scrollView.contentSize = CGSizeMake(350, 250);
}


/*
 *  scrollView 无法滚动的可能原因
 *  1> 没有设置contentSize
 *  2> scrollView.scrollEnabled = NO;
 *  3> scrollView.userInteractionEnabled = NO;
 */


@end
