//
//  ZYLSnsRowsModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYLSnsRowsModel : NSObject

@property (nonatomic,copy) NSString *voteOptionList;
@property (nonatomic,copy) NSNumber *selectedOption;
@property (nonatomic,copy) NSNumber *reply;
@property (nonatomic,copy) NSString *ids;
@property (nonatomic,copy) NSNumber *userLevel;
@property (nonatomic,copy) NSNumber *level;
@property (nonatomic,copy) NSString *postIconUrls;
@property (nonatomic,copy) NSNumber *lastUpdateTime;
@property (nonatomic,copy) NSString *dealTimeInfo;
@property (nonatomic,copy) NSString *picUrlSeparator;
@property (nonatomic,copy) NSString *parent;
@property (nonatomic,copy) NSString *groupList;
@property (nonatomic,copy) NSNumber *essenceStatus;
@property (nonatomic,copy) NSNumber *picCount;
@property (nonatomic,copy) NSNumber *isVote;
@property (nonatomic,copy) NSNumber *visit;
@property (nonatomic,copy) NSNumber *score;
@property (nonatomic,copy) NSString *sessionData;
@property (nonatomic,copy) NSNumber *type;
//@property (nonatomic,copy) NSNumber *newPostStatus;
@property (nonatomic,copy) NSString *contentWithoutPics;
@property (nonatomic,copy) NSNumber *orderWeight;
//@property (nonatomic,copy) NSString *newPicUrls;
@property (nonatomic,copy) NSNumber *rewardFlowerCount;
@property (nonatomic,copy) NSString *schemaUri;
@property (nonatomic,copy) NSString *nickName;
@property (nonatomic,copy) NSNumber *totalVote;
@property (nonatomic,copy) NSString *root;
@property (nonatomic,copy) NSNumber *recommendStatus;
@property (nonatomic,copy) NSNumber *status;
@property (nonatomic,copy) NSNumber *showStatus;
@property (nonatomic,copy) NSString *content;
@property (nonatomic,copy) NSArray *picUrls;
@property (nonatomic,copy) NSString *groupIds;
@property (nonatomic,copy) NSNumber *groupId;
@property (nonatomic,copy) NSString *userHeadUrl;
@property (nonatomic,copy) NSDictionary *recommendGroup;
@property (nonatomic,copy) NSNumber *isSignin;
@property (nonatomic,copy) NSNumber *alreadyVoted;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *signin;
@property (nonatomic,copy) NSNumber *userId;

+(id)snsRowsWithDict:(NSDictionary *)dict;

@end
