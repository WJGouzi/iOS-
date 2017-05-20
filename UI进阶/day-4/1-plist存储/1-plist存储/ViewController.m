//
//  ViewController.m
//  1-plist存储
//
//  Created by gouzi on 2017/5/18.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}



- (IBAction)save:(UIButton *)sender {
    NSArray *dataArray = @[@"wangjun", @10];
    
    // 路径是沙盒路径
    /*
     *参数1:搜索的目录
     *参数2:搜索范围
     *参数3:是否展开路径 iOS不识别这个 `~`,所以路径必须获取全路径，设置值要为YES
     */
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).lastObject;
    // 拼接一个文件名
//    NSString *fullPath = [path stringByAppendingString:@"/data.plist"];
    // 专门的方法 : stringByAppendingPathComponent 自动拼接文件的路径。
    NSString *fullPath = [path stringByAppendingPathComponent:@"data.plist"]; // plist文件只能保存基本的数据类型，并不能对自定义的对象进行保存。
    
    NSLog(@"%@", fullPath);
    [dataArray writeToFile:fullPath atomically:YES];
    
}

- (IBAction)read:(UIButton *)sender {
    // 沙盒的路径
    NSString *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    NSString *filePath = [path stringByAppendingPathComponent:@"data.plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    NSLog(@"array is %@", array);
}
@end
