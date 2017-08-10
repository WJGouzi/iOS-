//
//  ViewController.m
//  4-线程间通信
//
//  Created by gouzi on 2017/8/7.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    [NSThread detachNewThreadSelector:@selector(wjDownloadImage) toTarget:self withObject:nil];

}

- (void)wjDownloadImage {
    // http://img4.imgtn.bdimg.com/it/u=816246739,294523191&fm=214&gp=0.jpg
    // 1.下载图片的url
    NSURL *url = [NSURL URLWithString:@"http://pic1.win4000.com/wallpaper/d/573d37cc14e3c.jpg"];
    // 2.下载图片到本地->二进制数据 -> 耗时操作
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    // 3.将二进制数据转为图片
    UIImage *img = [UIImage imageWithData:imageData];
    // 4.显示UI
    [self performSelectorOnMainThread:@selector(wjShowImage:) withObject:img waitUntilDone:YES];
//    self.imageView.image = img;
    // 简便方法
//    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:img waitUntilDone:YES];
}

- (void)wjShowImage:(UIImage *)img {
    self.imageView.image = img;
}


- (void)wjDownloadImageCountTime {
    NSDate *start = [NSDate date]; // 获得当前时间
    NSURL *url = [NSURL URLWithString:@"http://pic1.win4000.com/wallpaper/d/573d37cc14e3c.jpg"];
    NSData *imageData = [NSData dataWithContentsOfURL:url];
    UIImage *img = [UIImage imageWithData:imageData];
    self.imageView.image = [img imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSDate *end = [NSDate date];
    NSLog(@"count time is: %f", [end timeIntervalSinceDate:start]);
}




@end

