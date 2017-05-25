//
//  ViewController.m
//  7-画板
//
//  Created by gouzi on 2017/5/25.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjDoodleBoardView.h"
#import "wjHandleView.h"

@interface ViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate, wjHandleViewDelegate>
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
    // 从系统相册中选择一张图片
    // 1弹出系统相册
    UIImagePickerController *pickerVC = [[UIImagePickerController alloc] init];
    // 设置照片的来源
    [pickerVC setSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
    pickerVC.delegate = self;
    [self presentViewController:pickerVC animated:YES completion:nil];
    
}

- (IBAction)wjCameraGetPhotoAction:(UIBarButtonItem *)sender {
    UIImagePickerController *camerPicker = [[UIImagePickerController alloc] init];
    [camerPicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    camerPicker.delegate = self;
    [self presentViewController:camerPicker animated:YES completion:nil];
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
    NSLog(@"%@",contextInfo);
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存成功" message:@"" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}


#pragma mark - 相册\相机的代理
/** 当选择某个照片的时候会调用某个方法 */
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    NSLog(@"%@", info);
    UIImage *img = info[@"UIImagePickerControllerOriginalImage"];
    // 验证有没选择成功
//    NSData *data = UIImageJPEGRepresentation(img, 1);
//    [data writeToFile:@"/Users/wangjun/Desktop/photo.jpg" atomically:YES];

    // 先展示
    wjHandleView *handleImageView = [[wjHandleView alloc] initWithFrame:self.wjDoodleBoardView.frame];
    handleImageView.backgroundColor = [UIColor clearColor];
    handleImageView.image = img;
    handleImageView.delegate = self;
    [self.view addSubview:handleImageView];
    
    // 把图片传给画板
    // 这样做会把还未进行编辑的图片直接显示到界面上
//    self.wjDoodleBoardView.image = img;
    // 当前的pickviewdissmiss
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - wjHandleViewDelegate
- (void)handleImageView:(wjHandleView *)handleImageView newImage:(UIImage *)newImage {
    self.wjDoodleBoardView.image = newImage;
}




@end
