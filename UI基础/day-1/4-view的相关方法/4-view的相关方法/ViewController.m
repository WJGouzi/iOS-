//
//  ViewController.m
//  4-view的相关方法
//
//  Created by gouzi on 2017/3/10.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
//@property (strong, nonatomic) IBOutlet UIView *redView;

@property (weak, nonatomic) UIView *redView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 绑定tag值
    // 根据tag拿到对应的view
    self.redView = [self.view viewWithTag:100];
    /*
     *  1.尽量少使用tag
     *  1.1tag的使用效率非常差
     *  1.2tag使用多了，容易乱
     */
    
    
    
    
    
    
    
    // 1.1创建UISwitch对象
    UISwitch *wjSwitch = [[UISwitch alloc] init];
    
    // 1.2加到控制器的view中
    [self.view addSubview:wjSwitch];
    
    // 1.3创建UISwitch对象
    UISwitch *wjSwitch1 = [[UISwitch alloc] init];
    // 1.4加到红色的view中
    [self.redView addSubview:wjSwitch1];
    // 1.5 选项卡对象
    UISegmentedControl *wjSegment = [[UISegmentedControl alloc] initWithItems:@[@"ha", @"he", @"xi"]];
    // 1.6加到红色的view中
    [self.redView addSubview:wjSegment];
    // 1.7移除
//    [wjSegment removeFromSuperview];
//    [self.redView removeFromSuperview];
//    [wjSwitch removeFromSuperview];
    [self.view removeFromSuperview];
    
}

// 只要控件有父控件就一定可以移除
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
//    [self.view removeFromSuperview];
}


- (IBAction)removeRedView:(UIButton *)sender {
    [self.redView removeFromSuperview];
}


- (IBAction)clickBtn:(UIButton *)button {
    // 做私人的事情
    /*
     if (button == self.btn1) {
     NSLog(@"点击了按钮1");
     }else if (button == self.btn2) {
     NSLog(@"点击了按钮2");
     }else{
     NSLog(@"点击了按钮3");
     }
     */
    
    switch (button.tag) {
        case 4:
            NSLog(@"点击了按钮1");
            break;
        case 5:
            NSLog(@"点击了按钮2");
            break;
        case 6:
            NSLog(@"点击了按钮3");
            break;
        default:
            break;
    }
    
    // 做公共的事情
    NSLog(@"做公共的事情");
}




@end
