//
//  ZYLNewsFactoryModel.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLNewsFactoryModel.h"
#import "ZYLOrdinaryGoodsModel.h"
#import "ZYLHerComModel.h"
#import "ZYLSubjectExerciseModel.h"
#import "ZYLTryModel.h"
#import "ZYLSingleModel.h"

@implementation ZYLNewsFactoryModel

+(ZYLBaseModel *)baseWithDict:(NSDictionary *)dict{
    
    ZYLBaseModel *baseModel = nil;
    if ([dict[@"typeName"] isEqualToString:@"普通商品"]) {
        baseModel = [ZYLOrdinaryGoodsModel ordinaryGoodsWithDict:dict];
        baseModel.cellHeight = 450;
    }
    else if ([dict[@"typeName"] isEqualToString:@"她社区"]) {
        baseModel = [ZYLHerComModel herComWithDict:dict];
        baseModel.cellHeight = 258;
    }
    else if ([dict[@"typeName"] isEqualToString:@"主题活动"]) {
        baseModel = [ZYLSubjectExerciseModel subjectExerciseWithDict:dict];
        baseModel.cellHeight = 480;
    }
    else if ([dict[@"typeName"] isEqualToString:@"虚拟试衣"]) {
        baseModel = [ZYLTryModel tryWithDict:dict];
        baseModel.cellHeight = 258;
    }
    else if ([dict[@"typeName"] isEqualToString:@"主推单品"]) {
        baseModel = [ZYLSingleModel singleWithDict:dict];
        baseModel.cellHeight = 420;
    }
    else{
        baseModel = [ZYLTryModel tryWithDict:dict];
        baseModel.cellHeight = 258;
    }
    return baseModel;
}

@end
