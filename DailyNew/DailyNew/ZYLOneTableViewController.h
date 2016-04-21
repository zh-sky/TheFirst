//
//  ZYLOneTableViewController.h
//  DailyNew
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLRootController.h"

@interface ZYLOneTableViewController : ZYLRootController


@property (nonatomic, strong) UITableView *TableView;

@property (nonatomic, strong) NSArray *DataArray;

@property (nonatomic, strong) NSDictionary *DataDict;

-(void)refeshdata;

@end
