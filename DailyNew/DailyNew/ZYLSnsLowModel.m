//
//  ZYLSnsLowModel.m
//  DailyNew
//
//  Created by qianfeng on 15/11/1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSnsLowModel.h"

@implementation ZYLSnsLowModel

+(id)snsLowWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}

@end
