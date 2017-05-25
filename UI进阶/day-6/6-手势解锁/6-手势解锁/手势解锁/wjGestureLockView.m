//
//  wjGestureLockView.m
//  6-手势解锁
//
//  Created by gouzi on 2017/5/24.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "wjGestureLockView.h"


@interface wjGestureLockView ()


/** 当前选中的按钮*/
@property (nonatomic, strong) NSMutableArray *selectedBtnArray;

/* currentPoint*/
@property (nonatomic, assign) CGPoint currentPoint;

@end


@implementation wjGestureLockView

- (NSMutableArray *)selectedBtnArray {
    if (!_selectedBtnArray) {
        _selectedBtnArray = [NSMutableArray array];
    }
    return _selectedBtnArray;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // 搭建界面
    [self setUpInterFace];
    
}


// 添加按钮
- (void)setUpInterFace {
    for (int i = 0; i < 9; ++i) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.userInteractionEnabled = NO;
        btn.tag = i;
        [btn setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"gesture_node_selected"] forState:UIControlStateSelected];
        [self addSubview:btn];
    }
}



// 重新绘制frame
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat x = 0;
    CGFloat y = 0;
    CGFloat WH = 74;
    int column = 3; // 列
    int currentColumn = 0;
    int currentRaw = 0;
    
    CGFloat margin = (self.frame.size.width - column * WH) / (column + 1);

    // 取出每一个按钮的frame值
    for (int i = 0; i < self.subviews.count; i++) {
        currentColumn = i % column;
        currentRaw = i / column;
        x = margin + (WH + margin) * currentColumn;
        y = margin + (WH + margin) * currentRaw;
        
        UIButton *btn = self.subviews[i];
        btn.frame = CGRectMake(x, y, WH, WH);
    }
}

// 监听手势
// 手指开始点击的时候进行调用
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 当前手指所在的点在按钮的范围内，在的话，按钮被选中状态
    // 1获取手指所在的点
    CGPoint currentPoint = [self wjGetCurrentPointWithTouches:touches];
    // 2判断点是否在按钮范围内
    UIButton *btn = [self judgeButtonRectContainPoint:currentPoint];
    if (btn && btn.selected == NO) {
        btn.selected = YES;
        [self.selectedBtnArray addObject:btn];
    }
}


// 手指开始移动的时候进行调用
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CGPoint currentPoint = [self wjGetCurrentPointWithTouches:touches];
    UIButton *btn = [self judgeButtonRectContainPoint:currentPoint];
    if (btn && btn.selected == NO) {
        btn.selected = YES;
        [self.selectedBtnArray addObject:btn];
    }
    // 重绘
    [self setNeedsDisplay];
    self.currentPoint = currentPoint;
}

// 获取手指所在的点
- (CGPoint)wjGetCurrentPointWithTouches:(NSSet *)touches {
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    return currentPoint;
}

// 给定的点是否在按钮的身上
- (UIButton *)judgeButtonRectContainPoint:(CGPoint)point {
    for (UIButton *btn in self.subviews) {
        BOOL isContain =  CGRectContainsPoint(btn.frame, point);
        if (isContain) {
            return btn;
        }
    }
    return nil;
}



- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSMutableString *mutStr = [NSMutableString string];
    // 1取消所有选中的按钮
    for (UIButton *btn in self.selectedBtnArray) {
        NSLog(@"%ld", btn.tag);
        btn.selected = NO;
        [mutStr appendFormat:@"%ld", btn.tag];
    }
    // 2清空路径
    [self.selectedBtnArray removeAllObjects];
    [self setNeedsDisplay];
    // 3查看按钮选择的顺序
    NSLog(@"%@", mutStr);
    
    // 存储密码
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *keyWord = [defaults objectForKey:@"pwd"];
    if (!keyWord) {
        [defaults setObject:mutStr forKey:@"pwd"];
        [defaults synchronize];
        NSLog(@"第一次绘制");
    } else {
        if ([keyWord isEqualToString:mutStr]) {
            // 正确绘制
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"您输入的手势正确" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
        } else {
            // 绘制失败
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"您输入的手势错误" message:nil delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            [alertView show];
            
        }
    }
}






- (void)drawRect:(CGRect)rect {
    if (self.selectedBtnArray.count) {
        // 划线
        UIBezierPath *path = [UIBezierPath bezierPath];
        // 取出所有保存的选中的按钮
        for (int i = 0; i < self.selectedBtnArray.count; i++) {
            // 取出每个按钮
            UIButton *btn = self.selectedBtnArray[i];
            if (i == 0) {
                // 判断当前的按钮是否为第一个按钮，如果是，则设置成路径的起点
                [path moveToPoint:btn.center];
            } else {
                [path addLineToPoint:btn.center];
            }
        }
        
        
        // 添加一根线到当前手指所在的点
        // 拿到手指当前所在的点
        [path addLineToPoint:self.currentPoint];
        [path setLineJoinStyle:kCGLineJoinRound];
        [path setLineWidth:10.f];
        [[UIColor redColor] set];
        [path stroke];
    }
}













@end
