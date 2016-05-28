//
//  AppDelegate.m
//  DailyNew
//
//  Created by qianfeng on 15/10/19.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ZYLTabBarController.h"
#import "Header.h"
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "UMSocialQQHandler.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //////xgchgjkhkjkkl
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self createTabBar];
    [self configUM];
    
    [self.window makeKeyAndVisible];
    return YES;
}

//友盟分享
-(void)configUM{
    [UMSocialData setAppKey:@"5556a53667e58e1bb500661d"];
//    [UMSocialWechatHandler setWXAppId:@"wxd930ea5d5a258f4f" appSecret:@"db426a9829e4b49a0dcac7b4162da6b6" url:@"http://www.umeng.com/social"];
//    [UMSocialQQHandler  setQQWithAppId:@"100424468" appKey:@"c7394704798a158208a74ab60104f0ba" url:@"http://www.umeng.com/social"];
}

//创建tabbar
-(void)createTabBar{
    
    
    
    ZYLTabBarController *tabbar = [[ZYLTabBarController alloc] init];
    [tabbar createButton:5];
    
    tabbar.titlePage = @[@"每日新款",@"搜索",@"试衣",@"",@"我的"];
    
    tabbar.URLPages = @[NEW_PAGE,NEW_PAGE,TRY_PAGE,SNS_PAGE,MY_PAGE];
    
    tabbar.controllerName = @[@"ZYLNewController",@"ZYLSearchController",@"ZYLTryController",@"ZYLSnsController",@"ZYLMyController"];
    
    
    
    tabbar.imageName = @[@"new",@"navigation-0505",@"photograph",@"sns",@"my"];
    
    tabbar.selectedImage = @[@"bj-di",@"bj-di",@"bj-di",@"bj-di",@"bj-di"];
    
    tabbar.titleLable = @[@"新款",@"搜索",@"试衣",@"社区",@"我的"];
    
    

    self.window.rootViewController = tabbar;
   
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
