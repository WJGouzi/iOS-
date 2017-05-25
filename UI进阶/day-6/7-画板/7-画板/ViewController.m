//
//  ViewController.m
//  7-画板
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjDoodleBoardView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet wjDoodleBoardView *wjDoodleBoardView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (BOOL)prefersStatusBarHidden {
    return YES;
}


/** 清屏*/
- (IBAction)wjClearScreenAction:(UIBarButtonItem *)sender {
    [self.wjDoodleBoardView wjClearScreen];
}

/** 撤销 */
- (IBAction)wjUndoAction:(UIBarButtonItem *)sender {
    [self.wjDoodleBoardView wjUndo];
}

/** 擦除*/
static BOOL isClicked = YES;
- (IBAction)wjEraseAction:(UIBarButtonItem *)sender {
    NSDictionary *dict = @{
                           NSForegroundColorAttributeName : [UIColor redColor]
                    
                           };
    [sender setTitleTextAttributes:isClicked ? dict : nil forState:UIControlStateNormal];
    [self.wjDoodleBoardView wjErase];
    isClicked = !isClicked;
}

/** 线宽*/
- (IBAction)wjSetLineWidthAction:(UISlider *)sender {
    [self.wjDoodleBoardView wjSetLineWidth:sender.value];
}

/** 线的颜色*/
- (IBAction)wjSetLineColorAction:(UIButton *)sender {
    [self.wjDoodleBoardView wjSetLineColor:sender.backgroundColor];
}

/** 读取照片*/
- (IBAction)wjPhotoReadAction:(UIBarButtonItem *)sender {
    
    
}

/** 保存*/
- (IBAction)wjSaveToAlbumAction:(UIBarButtonItem *)sender {
    // 保存到系统相册中
    // 相当于截屏
    UIGraphicsBeginImageContextWithOptions(self.wjDoodleBoardView.bounds.size, NO, 0);
    //
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.wjDoodleBoardView.layer renderInContext:ctx];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // 存储
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image: didFinishSavingWithError: contextInfo:), nil);
    
}

// 必须使用的方法
- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"保存");
}


@end
