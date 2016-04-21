//
//  ZYLBaseModel.h
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZYLBaseModel : NSObject

//共用属性
@property (nonatomic,copy) NSString *typeName;
@property (nonatomic,copy) NSString *sessionData;

@property (nonatomic,copy) NSString *itemId;
@property (nonatomic,copy) NSString *typeId;

//@property (nonatomic,copy) NSString *url;

//另加属 性行高
@property(nonatomic,assign)CGFloat cellHeight;


+(id)baseModelWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
