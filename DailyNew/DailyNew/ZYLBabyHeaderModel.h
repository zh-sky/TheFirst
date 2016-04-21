//
//  ZYLBabyHeaderModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLBabyHeaderModel : NSObject


@property (nonatomic,copy) NSString *openType;
@property (nonatomic,copy) NSNumber *itemId;
@property (nonatomic,copy) NSString *typeName;
@property (nonatomic,copy) NSString *tags;
@property (nonatomic,copy) NSString *shopLevelOriPic;
@property (nonatomic,copy) NSString *mainPic;
@property (nonatomic,copy) NSNumber *adType;
@property (nonatomic,copy) NSNumber *volume;
@property (nonatomic,copy) NSNumber *shopId;
@property (nonatomic,copy) NSString *otherCopywriter;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSString *buyUrl;
@property (nonatomic,copy) NSNumber *shopLevelDetail;
@property (nonatomic,copy) NSString *recommendItems;
@property (nonatomic,copy) NSString *shopLevel;
@property (nonatomic,copy) NSString *shopName;
@property (nonatomic,copy) NSNumber *xksId;
@property (nonatomic,copy) NSString *xksName;
@property (nonatomic,copy) NSString *imgUrls;
@property (nonatomic,copy) NSString *weiboCopywriter;
@property (nonatomic,copy) NSString *bidUrl;
@property (nonatomic,copy) NSString *comments;
@property (nonatomic,copy) NSString *typeId;
@property (nonatomic,copy) NSNumber *price;
@property (nonatomic,copy) NSString *numId;
@property (nonatomic,copy) NSNumber *tkType;
@property (nonatomic,copy) NSString *thumbnails;
@property (nonatomic,copy) NSNumber *brokerageStatus;



+(id)babyHeaderModelWithDict:(NSDictionary *)dict;

@end
