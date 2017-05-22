//
//  ViewController.m
//  3-下载进度显示
//
//  Created by gouzi on 2017/5/22.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjProgressView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *wjPercentLable;
@property (weak, nonatomic) IBOutlet UISlider *wjSlider;
@property (weak, nonatomic) IBOutlet wjProgressView *wjProgressView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)valueChangedAction:(UISlider *)slider {
    // 获取到现在的进度值
    self.wjPercentLable.text = [NSString stringWithFormat:@"%.2f%%", slider.value * 100];
    self.wjProgressView.progressValue = slider.value;
    // 每次传值的时候都要进行绘制,所以要重写set方法
    
    
}



@end
