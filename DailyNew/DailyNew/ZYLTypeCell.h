//
//  ZYLTypeCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLTypeModel.h"

@interface ZYLTypeCell : UITableViewCell

@property (nonatomic, strong) ZYLTypeModel *model;

+(id)typeCellWithTableView:(UITableView *)tableView;

@end
