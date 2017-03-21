//
//  ViewController.m
//  2-showBigSizeImage
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
    UIImage *image = [UIImage imageNamed:@"minion"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.scrollView addSubview:imageView];
//    CGFloat imageW = image.size.width;
//    CGFloat imageH = image.size.height;
    self.scrollView.contentSize = image.size;//CGSizeMake(imageW, imageH);
}


@end
