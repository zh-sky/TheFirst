//
//  ZYLSubjectDetailModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYLSubjectDetailModel : NSObject


@property (nonatomic,copy) NSString *infoClass;
@property (nonatomic,copy) NSString *openType;
@property (nonatomic,copy) NSString *originalPrice;
@property (nonatomic,copy) NSNumber *timeStamp;
@property (nonatomic,copy) NSString *url;
@property (nonatomic,copy) NSString *typeName;
@property (nonatomic,copy) NSNumber *adType;
@property (nonatomic,copy) NSString *itemId;
@property (nonatomic,copy) NSString *otherCopywriter;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *soldOut;
@property (nonatomic,copy) NSNumber *picWidth;
@property (nonatomic,copy) NSString *discount;
@property (nonatomic,copy) NSString *sourceStream;
@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSString *adStyle;
@property (nonatomic,copy) NSNumber *highLight;
@property (nonatomic,copy) NSString *actionId;
@property (nonatomic,copy) NSString *tagImgUrl;
@property (nonatomic,copy) NSString *freeShipping;
@property (nonatomic,copy) NSString *weiboCopywriter;
@property (nonatomic,copy) NSNumber *picHeight;
@property (nonatomic,copy) NSString *youpin;
@property (nonatomic,copy) NSString *typeId;
@property (nonatomic,copy) NSString *price;
@property (nonatomic,copy) NSString *tagStyle;
@property (nonatomic,copy) NSNumber *reranked;

//另加属 性行高
@property(nonatomic,assign) CGFloat cellHeight;


+(id)subjectDetailModelWithDict:(NSDictionary *)dict;

@end
