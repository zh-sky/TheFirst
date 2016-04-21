//
//  ZYLBabyCellModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/28.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYLBabyCellModel : NSObject

@property (nonatomic,copy) NSString *imgUrl;
@property (nonatomic,copy) NSNumber *compressed;
@property (nonatomic,copy) NSString *height;
@property (nonatomic,copy) NSString *width;


@property (nonatomic,assign) CGFloat cellHeight;


+(id)babyModelWithDict:(NSDictionary *)dict;

@end
