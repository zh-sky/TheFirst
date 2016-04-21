//
//  ZYLOrdinaryGoodsModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLBaseModel.h"

@interface ZYLOrdinaryGoodsModel : ZYLBaseModel


@property (nonatomic,copy) NSString *infoClass;
@property (nonatomic,copy) NSString *openType;
@property (nonatomic,copy) NSString *volume;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *imgUrl;
//@property (nonatomic,copy) NSString *typeName;
@property (nonatomic,copy) NSNumber *adType;
@property (nonatomic,copy) NSNumber *timeStamp;
//@property (nonatomic,copy) NSString *itemId;
//@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSNumber *picWidth;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *sourceStream;
@property (nonatomic,copy) NSString *otherCopywriter;
@property (nonatomic,copy) NSNumber *highLight;
@property (nonatomic,copy) NSNumber *offline;
@property (nonatomic,copy) NSString *weiboCopywriter;
@property (nonatomic,copy) NSNumber *picHeight;
//@property (nonatomic,copy) NSString *typeId;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSNumber *dressingId;
@property (nonatomic,copy) NSNumber *showAt;
@property (nonatomic,copy) NSNumber *reranked;


+(id)ordinaryGoodsWithDict:(NSDictionary *)dict;

@end
