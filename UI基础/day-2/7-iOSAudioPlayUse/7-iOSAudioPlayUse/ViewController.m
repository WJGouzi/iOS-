//
//  ViewController.m
//  7-iOSAudioPlayUse
//
//  Created by gouzi on 2017/3/14.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *bgImageView;

@property (nonatomic, strong) AVPlayer *player;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 加毛玻璃效果
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    toolBar.frame = self.bgImageView.bounds;
    toolBar.barStyle = UIBarStyleBlack;
    toolBar.alpha = 0.95;
    [self.bgImageView addSubview:toolBar];
    
    // 创建播放器
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"mySong1" ofType:@"mp3"];
//    NSURL *playerUrl = [NSURL fileURLWithPath:path];
    NSURL *playerUrl = [[NSBundle mainBundle] URLForResource:@"mySong1.mp3" withExtension:nil];
    AVPlayerItem *playerItem = [[AVPlayerItem alloc] initWithURL:playerUrl];
    AVPlayer *player = [[AVPlayer alloc] initWithPlayerItem:playerItem];
    self.player = player;
}

- (IBAction)playOrPause:(UIButton *)sender {
    switch (sender.tag) {
        case 3:
            [self.player play];
            break;
        case 4:
            [self.player pause];
            break;
        default:
            break;
    }
}



/**
    切歌
 */
- (IBAction)changeMusic:(UIButton *)sender {
    NSString *nameStr = nil;

    switch (sender.tag) {
        case 1:
            nameStr = @"mySong2.mp3";
            break;
        case 2:
            nameStr = @"mySong3.mp3";
            break;
        default:
            break;
    }
    NSURL *url = [[NSBundle mainBundle] URLForResource:nameStr withExtension:nil];
    AVPlayerItem *item = [[AVPlayerItem alloc] initWithURL:url];
    [self.player replaceCurrentItemWithPlayerItem:item];
    [self.player play];
}


@end
