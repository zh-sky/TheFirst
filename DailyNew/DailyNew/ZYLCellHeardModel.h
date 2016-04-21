//
//  ZYLCellHeardModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLCellHeardModel : NSObject

@property (nonatomic,copy) NSString *defaultOption;
@property (nonatomic,copy) NSNumber *signinTimes;
@property (nonatomic,copy) NSNumber *id;
@property (nonatomic,copy) NSString *signinStart;
@property (nonatomic,copy) NSString *ownerNickName;
@property (nonatomic,copy) NSString *ownerHeadUrl;
//@property (nonatomic,copy) NSString *description;
@property (nonatomic,copy) NSString *groupIcon;
@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSString *picUrl;
@property (nonatomic,copy) NSNumber *nReplies;
@property (nonatomic,copy) NSNumber *type;
@property (nonatomic,copy) NSNumber *ownerId;
@property (nonatomic,copy) NSString *realSigninEnd;
@property (nonatomic,copy) NSNumber *isNew;
@property (nonatomic,copy) NSString *ownerGroupDetailUrl;
@property (nonatomic,copy) NSNumber *isOwner;
@property (nonatomic,copy) NSString *realSigninStart;
@property (nonatomic,copy) NSString *descriptionBak;
@property (nonatomic,copy) NSNumber *status;
@property (nonatomic,copy) NSNumber *onlineCnt;
@property (nonatomic,copy) NSNumber *showInList;
@property (nonatomic,copy) NSNumber *kind;
@property (nonatomic,copy) NSNumber *readOnly;
@property (nonatomic,copy) NSNumber *detailSort;
@property (nonatomic,copy) NSNumber *isTop;
@property (nonatomic,copy) NSString *ownerIds;
@property (nonatomic,copy) NSNumber *isSignin;
@property (nonatomic,copy) NSNumber *nAllReplies;
@property (nonatomic,copy) NSNumber *attention;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *defaultOptions;
@property (nonatomic,copy) NSString *newest;
@property (nonatomic,copy) NSString *signinEnd;

+(id)cellHeardWithDict:(NSDictionary *)dict;


@end
