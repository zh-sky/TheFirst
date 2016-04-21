//
//  ZYLDownLoad.m
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLDownLoad.h"
#import "Header.h"

@implementation ZYLDownLoad

+(void)download:(UITableView *)tableview Url:(NSString *)url{
    
}

-(void)download:(UITableView *)tableview Url:(NSString *)url{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
  
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

    
}


@end
