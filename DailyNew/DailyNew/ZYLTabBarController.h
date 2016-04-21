//
//  ZYLTabBarController.h
//  DailyNew
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYLTabBarController : UITabBarController

@property (nonatomic, strong) NSArray *titleLable;

@property (nonatomic, strong) NSArray *controllerName;

@property (nonatomic, strong) NSArray *imageName;

@property (nonatomic, strong) NSArray *selectedImage;

@property (nonatomic, strong) NSArray *buttonTabBar;

@property (nonatomic, strong) NSArray *URLPages;

@property (nonatomic, strong) NSArray *titlePage;





-(void)setController:(NSString *)controllerName title:(NSString *)title imageName:(NSString *)imageName selectImageName:(NSString *)selectedImage;

-(void)createButton:(NSInteger)buttonCount;

@end
