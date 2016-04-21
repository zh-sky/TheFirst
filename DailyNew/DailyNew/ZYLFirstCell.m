//
//  ZYLFirstCell.m
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLFirstCell.h"

@implementation ZYLFirstCell

+(id)firstCellView{
    return   [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

@end
