//
//  ViewController.m
//  2-偏好设置
//
//  Created by gouzi on 2017/5/20.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 保存全局的字体等，用户信息等,这就可以保存用户的一些偏好设置
}


- (IBAction)save:(UIButton *)sender {
    // userdefaults保存的也是字典
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"wj" forKey:@"name"];
    [defaults setInteger:10 forKey:@"size"];
    // 立即同步,也即是马上存入到文件中
    [defaults synchronize];
    
    NSLog(@"directory is %@", NSHomeDirectory()); // 自动保存到 ~library/Preferences/xxx.plist

}

- (IBAction)read:(UIButton *)sender {
    // 取对象
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    // 可以在任何地方进行取值
    NSString *name = [defaults objectForKey:@"name"];
    NSInteger size = [defaults integerForKey:@"size"];
    NSLog(@"name : %@ -- size : %ld", name, size);
}

@end
