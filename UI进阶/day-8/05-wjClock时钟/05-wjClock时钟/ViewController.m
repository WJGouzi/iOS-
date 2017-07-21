//
//  ViewController.m
//  05-wjClock时钟
//
//  Created by gouzi on 2017/7/20.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"

#define perSecondAngle 6      // 每一秒秒针的转动角度
#define perMinuteAngle 6      // 每一分钟分针的转动角度
#define perMinInSecAngle 0.1  // 每一秒分针的转动角度
#define perHourAngle 30       // 每一小时时针的转动角度
#define perHourInMinAngle 0.5 // 每一分钟时针的转动角度

// 角度转弧度
#define angleToRad(angle) ((angle) / 180 * M_PI)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *wjClockImageView;

/** 秒针 */
@property (nonatomic, weak) CALayer *secondLayer;

/** 分针 */
@property (nonatomic, weak) CALayer *minuteLayer;

/** 时针 */
@property (nonatomic, weak) CALayer *hourLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self wjAddSecondHandSettings];
    [self wjAddMinuteHandSettings];
    [self wjAddHourHandSettings];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];

    // 开始进来就进行旋转
    [self timeChange];
}


- (void)timeChange {
    // 获取当前的秒
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [calendar components:NSCalendarUnitSecond | NSCalendarUnitMinute | NSCalendarUnitHour fromDate:[NSDate date]];
    NSInteger currentSecond = components.second + 1;
    NSInteger currentMinute = components.minute;
    NSInteger currentHour = components.hour;
    
    // 秒针开始旋转
    // 计算秒针旋转的角度
    CGFloat secondAngle = perSecondAngle * currentSecond;
    self.secondLayer.transform = CATransform3DMakeRotation(angleToRad(secondAngle), 0, 0, 1);
    
    // 分针开始旋转
    CGFloat minuteAngle = perMinuteAngle * currentMinute + perMinInSecAngle * currentSecond;
    self.minuteLayer.transform = CATransform3DMakeRotation(angleToRad(minuteAngle), 0, 0, 1);
    
    // 时针开始旋转
    CGFloat hourAngle = perHourAngle * currentHour + perHourInMinAngle * currentMinute;
    self.hourLayer.transform = CATransform3DMakeRotation(angleToRad(hourAngle), 0, 0, 1);
    
}




/**
 秒针设置
 */
- (void)wjAddSecondHandSettings {
    CALayer *secondLayer = [[CALayer alloc] init];
    secondLayer.frame = CGRectMake(0, 0, 1, 80);
    // 设置旋转的锚点
    secondLayer.anchorPoint = CGPointMake(0.5, 0.95);
    // 设置中心点
    secondLayer.position = CGPointMake(self.wjClockImageView.bounds.size.width * 0.5, self.wjClockImageView.bounds.size.height * 0.5);
    secondLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.wjClockImageView.layer addSublayer:secondLayer];
    self.secondLayer = secondLayer;
    
}



/**
 分针设置
 */
- (void)wjAddMinuteHandSettings {
    CALayer *minuteLayer = [[CALayer alloc] init];
    minuteLayer.frame = CGRectMake(0, 0, 1, 70);
    minuteLayer.anchorPoint = CGPointMake(0.5, 0.97);
    minuteLayer.position = CGPointMake(self.wjClockImageView.bounds.size.width * 0.5, self.wjClockImageView.bounds.size.height * 0.5);
    minuteLayer.backgroundColor = [UIColor blueColor].CGColor;
    [self.wjClockImageView.layer addSublayer:minuteLayer];
    self.minuteLayer = minuteLayer;
}



/**
 时针设置
 */
- (void)wjAddHourHandSettings {
    CALayer *hourLayer = [[CALayer alloc] init];
    hourLayer.frame = CGRectMake(0, 0, 1, 60);
    hourLayer.anchorPoint = CGPointMake(0.5, 0.99);
    hourLayer.position = CGPointMake(self.wjClockImageView.bounds.size.width * 0.5, self.wjClockImageView.bounds.size.height * 0.5);
    hourLayer.backgroundColor = [UIColor blackColor].CGColor;
    [self.wjClockImageView.layer addSublayer:hourLayer];
    self.hourLayer = hourLayer;
}







//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    
//    self.secondLayer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//}






@end
