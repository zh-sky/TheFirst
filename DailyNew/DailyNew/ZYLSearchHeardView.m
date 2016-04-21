//
//  ZYLSearchHeardView.m
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSearchHeardView.h"

@interface ZYLSearchHeardView()

@property (weak, nonatomic) IBOutlet UILabel *title;


@end

@implementation ZYLSearchHeardView

+(id)searchHeardView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

-(void)setTitleLable:(NSString *)titleLable{
    
    _titleLable = titleLable;
    _title.text = titleLable;
    
}

@end
