//
//  ZYLSubjectDetailCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLSubjectDetailModel.h"

@interface ZYLSubjectDetailCell : UITableViewCell

@property (nonatomic, strong) ZYLSubjectDetailModel *model;

+(id)subjectCellWithTableView:(UITableView *)tableView;

@end
