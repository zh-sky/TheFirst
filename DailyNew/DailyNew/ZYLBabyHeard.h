//
//  ZYLBabyHeard.h
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLBabyHeaderModel.h"

@protocol babyShopdelegate <NSObject>

//跳转购买
-(void)changPage:(NSString *)urlName;

//进入店铺
-(void)changPageInShop:(NSString *)shopUrl WithShopName:(NSString *)name;

@end

@interface ZYLBabyHeard : UIView
@property (nonatomic, copy) void (^blockUM)();
@property (nonatomic, assign)  id<babyShopdelegate>delegate;

@property (nonatomic, strong) ZYLBabyHeaderModel *model;


+(id)babyHeardWithView;

@end
