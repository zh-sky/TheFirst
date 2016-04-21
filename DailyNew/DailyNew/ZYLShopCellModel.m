//
//  ZYLShopCellModel.m
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLShopCellModel.h"

@implementation ZYLShopCellModel

+(id)shopCellModelWithDict:(NSDictionary *)dict
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
