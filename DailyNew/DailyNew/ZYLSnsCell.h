//
//  ZYLSnsCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLSnsModel.h"

@interface ZYLSnsCell : UITableViewCell


@property (nonatomic, strong) ZYLSnsModel *model;

+(id)snsCellWithView;

@end
