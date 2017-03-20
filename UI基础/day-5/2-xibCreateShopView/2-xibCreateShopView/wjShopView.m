//
//  wjShopView.m
//  2-xibCreateShopView
//
//  Created by gouzi on 2017/3/20.
//  Copyright © 2017年 wangjun. All rights reserved.
//

#import "wjShopView.h"

@interface wjShopView ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *testLabel;
/** 毛玻璃 */
@property (nonatomic, weak) UIToolbar *toolBar;

@end

@implementation wjShopView


#pragma mark - xib的使用注意事项
/**
 xib使用注意事项:
 1> 如果一个view从xib中加载,就不能用[xxx alloc] init] 和 [xxx alloc] initWithFrame:]创建
 2> 如果一个xib经常被使用,应该提供快速构造类方法
 3> 如果一个view从xib中加载:
        用代码添加一些子控件,得在 initWithCoder: 和 awakeFromNib 创建
 4> 如果一个view从xib中加载,会调用initWithCoder: 和 awakeFromNib,不会调用init和initWithFrame:方法
 */



/**
 *  如果View从xib中加载,就不会调用 init 和 initWithFrame: 方法
 *
 */
/*
 - (instancetype)init{
 if (self = [super init]) {
 NSLog(@"%s", __func__);
 }
 return self;
 }
 
 - (instancetype)initWithFrame:(CGRect)frame{
 if (self = [super initWithFrame:frame]) {
 NSLog(@"%s", __func__);
 }
 return self;
 }
 */


/**
 *  如果View从xib中加载,就会调用 initWithCoder: 方法
 *  创建子控件,...
 *  注意: 如果子控件是从xib中创建,是处于未唤醒状态
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        /*
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor redColor];
        label.text = @"asdasda";
        self.testLabel = label;
        
        [self addSubview:label];
        */
    }
    return self;
}


/*
    快速构造方法
 */
+ (instancetype)shopView {
    
    return [[[NSBundle mainBundle] loadNibNamed:@"wjShopView" owner:nil options:nil] firstObject];
    
}

/**
 *  从xib中唤醒
 *  添加xib中创建的子控件 的子控件
 */
- (void)awakeFromNib {
    UIToolbar *toolBar = [[UIToolbar alloc] init];
    [self.iconView addSubview:toolBar];
    self.toolBar = toolBar;
}




// 布局子控件
- (void)layoutSubviews {
    [super layoutSubviews];
//    self.testLabel.frame = self.titleNameLabel.frame;
    self.toolBar.frame = self.iconView.frame;
}



- (void)setIconImage:(NSString *)imageName {
    self.iconView.image = [UIImage imageNamed:imageName];
}

- (void)setTitleName:(NSString *)titleName {
    self.titleNameLabel.text = titleName;
}



@end
