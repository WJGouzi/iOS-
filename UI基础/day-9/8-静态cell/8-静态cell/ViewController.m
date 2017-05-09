//
//  ViewController.m
//  8-静态cell
//
//  Created by gouzi on 2017/5/9.
//  Copyright © 2017年 wj. All rights reserved.
//  界面的数据可以定下来的时候，就可以使用静态cell，基本上都是放在storyboard中


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


#pragma mark - 代理方法

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%ld---%ld", indexPath.section, indexPath.row);
}


@end
