//
//  ZYLOrdinaryGoodsModel.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLOrdinaryGoodsModel.h"

@implementation ZYLOrdinaryGoodsModel

+(id)ordinaryGoodsWithDict:(NSDictionary *)dict{
    
    return [[self alloc] initWithDict:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
