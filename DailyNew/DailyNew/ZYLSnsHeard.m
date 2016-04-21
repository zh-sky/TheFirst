//
//  ZYLSnsHeard.m
//  DailyNew
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSnsHeard.h"

@interface ZYLSnsHeard()




@end

@implementation ZYLSnsHeard

+(id)snsHeardWithView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil ] lastObject];
}



@end
