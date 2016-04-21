//
//  ZYLSnsRowsCell.h
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLSnsRowsModel.h"


@interface ZYLSnsRowsCell : UITableViewCell

@property (nonatomic, strong) ZYLSnsRowsModel *model;

+(id)snsRowsCellWithView;

@end
