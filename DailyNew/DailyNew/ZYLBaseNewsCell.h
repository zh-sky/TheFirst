//
//  ZYLBaseNewsCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLBaseModel.h"
#import "Header.h"

@interface ZYLBaseNewsCell : UITableViewCell
{
    ZYLBaseModel *_baseModel;
}
@property (nonatomic, copy) void (^blockUM)();
@property (nonatomic, strong) ZYLBaseModel *baseModel;

+(id)baseCellWithTableView:(UITableView *)tableView;


@end
