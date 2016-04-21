//
//  ZYLHotPersonCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLHotPersonModel.h"

@interface ZYLHotPersonCell : UITableViewCell


@property (nonatomic, strong) ZYLHotPersonModel *personModel;
+(id)hotPersonCellWithTableView:(UITableView *)tableView;

@end
