//
//  ZYLSearchShopCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLSearchShopModel.h"

@interface ZYLSearchShopCell : UITableViewCell

@property (nonatomic, strong) ZYLSearchShopModel *model;

@property (nonatomic, strong) NSArray *modelArray;

@property (nonatomic, copy) void (^block)(NSString *title, NSString *url);

+(id)searchShopWith:(UITableView *)tableview;
@end
