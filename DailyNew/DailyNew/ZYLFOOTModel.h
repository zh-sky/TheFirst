//
//  ZYLFOOTModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLFOOTModel : NSObject

@property (nonatomic,copy) NSNumber *tagId;
@property (nonatomic,copy) NSNumber *weight;
@property (nonatomic,copy) NSString *tagName;
@property (nonatomic,copy) NSNumber *topCategoryId;
@property (nonatomic,copy) NSString *topCategoryName;

+(id)FootModelWithDict:(NSDictionary *)dict;

@end
