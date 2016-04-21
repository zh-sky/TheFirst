//
//  ZYLShopFoot.h
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLBabyHeaderModel.h"

@interface ZYLShopFoot : UIView

@property (nonatomic, copy) void (^blockUM)();

@property (nonatomic, strong) NSArray *imageArray;
@property (nonatomic, strong) NSArray *TypeArray;

@property (nonatomic, strong) ZYLBabyHeaderModel *allData;
@property (nonatomic, copy) void(^changToBuy)(NSString *url);

@property (nonatomic, copy) void (^changToBaby)(NSString *shopID,NSString *itemid);

@property (nonatomic, copy) void (^changtoType)(NSString *shopurl,NSString *shopname);

+(id)shopFootWith:(CGRect)frame;

@end
