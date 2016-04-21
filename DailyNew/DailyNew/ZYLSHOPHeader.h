//
//  ZYLSHOPHeader.h
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYLSHOPHeader : UIView

@property (nonatomic, copy) NSString *shopname;

@property (nonatomic, copy) NSString *shopurl;

@property (nonatomic, copy) void (^block)(NSString *url);

+(id)shopHeader;

@end
