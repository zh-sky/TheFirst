//
//  ZYLNewsFactoryModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZYLBaseModel.h"

@interface ZYLNewsFactoryModel : NSObject

+(ZYLBaseModel *)baseWithDict:(NSDictionary *)dict;

@end
