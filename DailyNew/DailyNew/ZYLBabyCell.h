//
//  ZYLBabyCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLBabyCellModel.h"

@interface ZYLBabyCell : UITableViewCell

//@property (nonatomic,assign) CGFloat cellHeight;

@property (nonatomic, strong) ZYLBabyCellModel *model;

+(id)babyCellWithTableView:(UITableView *)tableView;

@end
