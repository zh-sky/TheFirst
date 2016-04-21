//
//  ZYLCreateNavButton.m
//  DailyNew
//
//  Created by qianfeng on 15/10/23.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLCreateNavButton.h"

@implementation ZYLCreateNavButton

+(id)createNavButtonbackImage:(NSString *)backImage image:(NSString *)image title:(NSString *)title target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:backImage] forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    
    btn.adjustsImageWhenHighlighted = NO;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    btn.frame = CGRectMake(0, 0, 44, 44);
    
    UIBarButtonItem *Navbtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return Navbtn;
    
}

@end
