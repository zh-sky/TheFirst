//
//  ZYLNavController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLNavController.h"

@interface ZYLNavController ()

@end

@implementation ZYLNavController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
    [[UINavigationBar appearance] setBarTintColor:[UIColor grayColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
