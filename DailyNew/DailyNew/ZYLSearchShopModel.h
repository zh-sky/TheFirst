//
//  ZYLSearchShopModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLSearchShopModel : NSObject

//@property (nonatomic,copy) NSNumber *cateId;
//@property (nonatomic,copy) NSString *tagInfos;
//@property (nonatomic,copy) NSString *cateName;

@property (nonatomic,copy) NSNumber *flag;
@property (nonatomic,copy) NSString *openType;
@property (nonatomic,copy) NSNumber *tagID;
@property (nonatomic,copy) NSString *tagName;
@property (nonatomic,copy) NSString *url;

+(id)searchShopWithDict:(NSDictionary *)dict;

@end
