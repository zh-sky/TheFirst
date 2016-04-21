//
//  ZYLTrysCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLTrysModel.h"

@interface ZYLTrysCell : UITableViewCell

@property (nonatomic, strong) ZYLTrysModel *model;


+(id)trysCellWithTableView:(UITableView *)tableView;

@end
