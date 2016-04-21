//
//  ZYLMyMenuModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLMyMenuModel : NSObject

@property (nonatomic,copy) NSNumber *column;
@property (nonatomic,copy) NSString *openType;
@property (nonatomic,copy) NSString *infoClass;
@property (nonatomic,copy) NSNumber *timeStamp;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *typeName;
@property (nonatomic,copy) NSString *itemId;
@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSNumber *picWidth;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *otherCopywriter;
@property (nonatomic,copy) NSString *shareTitle;
@property (nonatomic,copy) NSNumber *lockType;
@property (nonatomic,copy) NSNumber *canShare;
@property (nonatomic,copy) NSString *sourceStream;
@property (nonatomic,copy) NSString *shareUrl;
@property (nonatomic,copy) NSString *mainImgUrl;
@property (nonatomic,copy) NSNumber *highLight;
@property (nonatomic,copy) NSString *iconUrl;
@property (nonatomic,copy) NSString *shareImgUrl;
@property (nonatomic,copy) NSString *shareDescription;
@property (nonatomic,copy) NSString *weiboCopywriter;
@property (nonatomic,copy) NSNumber *picHeight;
@property (nonatomic,copy) NSString *typeId;
@property (nonatomic,copy) NSNumber *reranked;

+(id)myMenuWithDict:(NSDictionary *)dict;

@end
