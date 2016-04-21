//
//  ZYLTryModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLBaseModel.h"

@interface ZYLTryModel : ZYLBaseModel


@property (nonatomic,copy) NSString *infoClass;
@property (nonatomic,copy) NSString *openType;
//@property (nonatomic,copy) NSString *itemId;
//@property (nonatomic,copy) NSString *typeName;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSNumber *showTitle;
@property (nonatomic,copy) NSNumber *picWidth;
@property (nonatomic,copy) NSString *otherCopywriter;
//@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSNumber *timeStamp;
@property (nonatomic,copy) NSNumber *showFavBtn;
@property (nonatomic,copy) NSString *shareTitle;
@property (nonatomic,copy) NSNumber *canShare;
@property (nonatomic,copy) NSNumber *showShareBtn;
@property (nonatomic,copy) NSString *shareUrl;
@property (nonatomic,copy) NSNumber *highLight;
@property (nonatomic,copy) NSString *sourceStream;
@property (nonatomic,copy) NSString *contentUrl;
@property (nonatomic,copy) NSString *shareDescription;
@property (nonatomic,copy) NSString *weiboCopywriter;
@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSNumber *picHeight;
//@property (nonatomic,copy) NSString *typeId;
@property (nonatomic,copy) NSString *detailMainImg;
@property (nonatomic,copy) NSString *issue;
@property (nonatomic,copy) NSNumber *showAt;
@property (nonatomic,copy) NSNumber *reranked;
//@property (nonatomic,copy) NSString *description;

+(id)tryWithDict:(NSDictionary *)dict;

@end
