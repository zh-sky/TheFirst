//
//  ZYLDatabass.h
//  DailyNew
//
//  Created by qianfeng on 15/11/4.
//  Copyright © 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZYLModel.h"

typedef enum RecordType{
    RecordTypeFavorite,
    RecordTypeDownload,
    RecordTypeBrowser,
}RecordType;

@interface ZYLDatabass : UIViewController



+(id)sharedInstance;

//记录保存到数据库中（收藏、下载、浏览）
-(void)addRecordWithAppModel:(ZYLModel*)model recordId:(NSString *)typeid;
//数据库删除记录（取消收藏）
-(void)removeRecordWithAppModel:(ZYLModel*)model recordId:(NSString *)typeid;
//查看一个应用是否被记录过
-(BOOL)isExistsRecordWithAppModel:(ZYLModel*)model recordId:(NSString *)typeid;
//获取所有的记录（收藏、下载、浏览）
-(NSArray*)recordWithRecordId:(NSString *)typeid;

@end
