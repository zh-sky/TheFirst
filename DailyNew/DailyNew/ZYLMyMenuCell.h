//
//  ZYLMyMenuCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLMyMenuModel.h"

@interface ZYLMyMenuCell : UITableViewCell

@property (nonatomic, strong) ZYLMyMenuModel *Model;

+(id)myMunuCellWithTableView:(UITableView *)tableView;

@end
