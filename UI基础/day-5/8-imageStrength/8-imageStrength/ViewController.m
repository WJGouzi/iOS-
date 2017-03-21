//
//  ViewController.m
//  8-imageStrength
//
//  Created by gouzi on 2017/3/21.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+wjImageStrength.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImage *image = [UIImage imageNamed:@"chat_send_nor"];//@"buttongreen"]; //  方式三 可以在源头上 对图片进行设置slices里对水平或者是垂直方向进行设置

    UIImage *resizableImage = [UIImage resizableImageWithOriginImageName:@"chat_send_nor"];
    // 图片的高度宽度
//    CGFloat imageW = image.size.width;
//    CGFloat imageH = image.size.height;
    
    // 方式一:
    // 返回一张被保护而且被拉伸的图片 --->  CapInsets:受保护的区域
    /*
    UIImage *resizableImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5 - 1, imageW * 0.5 -1)];
//    UIImage *resizableImage = [[image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5 - 1, imageW * 0.5 -1)] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    // UIImageResizingModeTile, 平铺
    // UIImageResizingModeStretch, 拉伸
    UIImage *resizableImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(imageH * 0.5, imageW * 0.5, imageH * 0.5 - 1, imageW * 0.5 -1) resizingMode:UIImageResizingModeTile];
    */
    
    // 方式二:
    /**
        // default is 0. if non-zero, horiz. stretchable. right cap is calculated as width - leftCapWidth - 1
        // 右边需要保护的区域 = 图片width - 左边保护区域 - 1；
     
        // default is 0. if non-zero, vert. stretchable. bottom cap is calculated as height - topCapHeight - 1
        // 底部需要保护的区域 = 图片height - 上边保护区域 - 1
     
    UIImage *resizableImage = [image stretchableImageWithLeftCapWidth:imageW * 0.5 topCapHeight:imageH * 0.5];
    */
    
    [self.btn setBackgroundImage:resizableImage forState:UIControlStateNormal];
    
}


@end
