//
//  ZYLSnsLowModel.h
//  DailyNew
//
//  Created by qianfeng on 15/11/1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYLSnsLowModel : NSObject

@property (nonatomic,copy) NSNumber *essenceStatus;
@property (nonatomic,copy) NSNumber *reply;
@property (nonatomic,copy) NSNumber *status;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSString *groupIds;
@property (nonatomic,copy) NSString *contentWithoutPics;
@property (nonatomic,copy) NSString *citeTime;
@property (nonatomic,copy) NSArray *picUrls;
@property (nonatomic,copy) NSString *identityUrl;
@property (nonatomic,copy) NSNumber *curPageNo;
@property (nonatomic,copy) NSNumber *lastUpdateTime;
@property (nonatomic,copy) NSNumber *type;
@property (nonatomic,copy) NSDictionary *parent;
@property (nonatomic,copy) NSString *picUrlSeparator;
@property (nonatomic,copy) NSDictionary *user;
@property (nonatomic,copy) NSNumber *ids;
@property (nonatomic,copy) NSNumber *level;
@property (nonatomic,copy) NSNumber *recommendStatus;
@property (nonatomic,copy) NSNumber *visit;
//@property (nonatomic,copy) NSString *newPicUrls;
@property (nonatomic,copy) NSString *root;
@property (nonatomic,copy) NSString *dealTimeInfo;
@property (nonatomic,copy) NSString *addToFirstList;
@property (nonatomic,copy) NSNumber *addToFirst;
@property (nonatomic,copy) NSString *postIconUrls;
@property (nonatomic,copy) NSString *content;

@property (nonatomic, assign) CGFloat cellHeight;

+(id)snsLowWithDict:(NSDictionary *)dict;

@end
