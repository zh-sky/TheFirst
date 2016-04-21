//
//  ZYLWEBController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLWEBController.h"
#import "ZYLNavController.h"

@interface ZYLWEBController ()

@end

@implementation ZYLWEBController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changetoWeb];
    
    self.tabBarController.tabBar.hidden = YES;
//    [self setNAV];
}

-(void)setNAV{
    
    ZYLNavController *nav = [[ZYLNavController alloc] initWithRootViewController:self];
    
    
}

-(void)changetoWeb{
    
    UIWebView *myWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64)];//rect是你设计好大小的矩形
    NSURL *url = [NSURL URLWithString:_url];
    //@"https://www.baidu.com/"
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:request];
    myWebView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myWebView];
    
}

@end
