//
//  ZYLShopCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLShopCellModel.h"

@interface ZYLShopCell : UITableViewCell

@property (nonatomic, strong) ZYLShopCellModel *model;

@property (nonatomic, strong) NSArray *modelArray;

@property (nonatomic, copy) void (^ChangePage)(NSString *sessData, NSString *itemID);

+(id)shopCellWithTableView:(UITableView *)tableView;


@end
