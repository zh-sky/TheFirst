//
//  ZYLSearchMenuCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYLSearchMenuCell : UITableViewCell

@property (nonatomic, strong) NSArray *titleBtn;
@property (nonatomic, strong) NSArray *imageBtn;
@property (nonatomic, strong) NSArray *selectImageBtn;
@property (nonatomic) NSInteger rowteger;

@property (nonatomic, copy) void(^block)(UIButton *btn);

+(id)searchMenuWithMenu:(UITableView *)tableView;

@end
