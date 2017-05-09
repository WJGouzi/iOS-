//
//  ViewController.m
//  9-自定义不等高cell-代码
//
//  Created by gouzi on 2017/5/9.
//  Copyright © 2017年 wj. All rights reserved.
//

#import "ViewController.h"
#import "wjStatusCell.h"
#import "wjStatusModel.h"
#import "MJExtension.h"

@interface ViewController ()


@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

static NSString *iden = @"status";
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.tableView.rowHeight = 250;
    [self.tableView registerClass:[wjStatusCell class] forCellReuseIdentifier:iden];
    
    
}


- (NSArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [wjStatusModel mj_objectArrayWithFilename:@"statuses.plist"];
    }
    return _dataArray;
}


#pragma mark - dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    wjStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:iden];
    cell.model = self.dataArray[indexPath.row];
    return cell;
}


#pragma mark - delegate
// 这调用这个方法之前就要算好每个cell的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    wjStatusCell *cell = [tableView cellForRowAtIndexPath:indexPath];  // 产生死循环 拿不到cell
    wjStatusModel *model = self.dataArray[indexPath.row];
    
    CGFloat space = 10;
    /** 图像 */
    CGFloat iconX = space;
    CGFloat iconY = space;
    CGFloat iconWH = 30;
    CGRect iconImageViewFrame = CGRectMake(iconX, iconY, iconWH, iconWH);
    
    /** 正文 */
    CGFloat textX = iconX;
    CGFloat textY = CGRectGetMaxY(iconImageViewFrame) + space;
    CGFloat textW = [UIScreen mainScreen].bounds.size.width - 2 * space;
    NSDictionary *textAtt = @{NSFontAttributeName : [UIFont systemFontOfSize:14]};
    // 最大宽度是textW,高度不限制
    CGSize textSize = CGSizeMake(textW, 100);
    CGFloat textH = [model.text boundingRectWithSize:textSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAtt context:nil].size.height;
    CGRect text_LabelFrame = CGRectMake(textX, textY, textW, textH);
    
    CGFloat cellHeight = 0;
    /** 配图 */
    if (model.picture) { // 有配图
        CGFloat pictureWH = 100;
        CGFloat pictureX = iconX;
        CGFloat pictureY = CGRectGetMaxY(text_LabelFrame) + space;
        CGRect pictureImageViewFrame = CGRectMake(pictureX, pictureY, pictureWH, pictureWH);
        cellHeight = CGRectGetMaxY(pictureImageViewFrame) + space;
    } else {
        cellHeight = CGRectGetMaxY(text_LabelFrame) + space;
    }
    
    return cellHeight;
}





@end
