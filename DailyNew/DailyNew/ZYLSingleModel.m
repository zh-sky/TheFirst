//
//  ZYLSingleModel.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSingleModel.h"

@implementation ZYLSingleModel
+(id)singleWithDict:(NSDictionary *)dict{
    return [self baseModelWithDict:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
