//
//  ZYLTwoTableViewController.h
//  DailyNew
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLRootController.h"


@interface ZYLTwoTableViewController : ZYLRootController

@property (nonatomic, strong) UITableView *tableViewleft;
@property (nonatomic, strong) UITableView *tableViewright;
// 存放所有的tableView
@property (nonatomic, strong) NSArray *allTables;

@property (nonatomic, strong) NSArray *DataArray;


@end
