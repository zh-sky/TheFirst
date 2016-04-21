//
//  ZYLShopFootModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLShopFootModel : NSObject


@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSNumber *itemId;
@property (nonatomic,copy) NSNumber *shopId;
@property (nonatomic,copy) NSNumber *price;
@property (nonatomic,copy) NSString *localUrl;

+(id)shopFootModelWithDict:(NSDictionary *)dict;

@end
