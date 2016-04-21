//
//  ZYLHotPersonModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYLHotPersonModel : NSObject

@property (nonatomic,copy) NSNumber *imgWidth;
@property (nonatomic,copy) NSString *infoClass;
@property (nonatomic,copy) NSString *openType;
@property (nonatomic,copy) NSNumber *volume;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *typeName;
@property (nonatomic,copy) NSNumber *adType;
@property (nonatomic,copy) NSNumber *timeStamp;
@property (nonatomic,copy) NSString *otherCopywriter;
@property (nonatomic,copy) NSString *itemId;
@property (nonatomic,copy) NSNumber *picWidth;
@property (nonatomic,copy) NSString *shareTitle;
@property (nonatomic,copy) NSString *sourceStream;
@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSString *shareUrl;
@property (nonatomic,copy) NSNumber *highLight;
@property (nonatomic,copy) NSString *ids;
@property (nonatomic,copy) NSString *shareImgUrl;
@property (nonatomic,copy) NSString *shareDescription;
@property (nonatomic,copy) NSString *weiboCopywriter;
@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSNumber *picHeight;
@property (nonatomic,copy) NSString *typeId;
@property (nonatomic,copy) NSNumber *price;
@property (nonatomic,copy) NSNumber *reranked;
@property (nonatomic,copy) NSNumber *imgHeight;
@property (nonatomic,copy) NSNumber *lock;

//另加属 性行高
@property(nonatomic,assign) CGFloat cellHeight;

+(id)hotPersonModelWithDict:(NSDictionary *)dict;

@end
