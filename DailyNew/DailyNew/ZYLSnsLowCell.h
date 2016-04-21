//
//  ZYLSnsLowCell.h
//  DailyNew
//
//  Created by qianfeng on 15/11/1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLSnsLowModel.h"

@interface ZYLSnsLowCell : UITableViewCell

@property (nonatomic, strong) ZYLSnsLowModel *model;

+(id)snsLowCellWithTableView:(UITableView *)tableView;

@end
