//
//  ZYLSubjectDetailController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSubjectDetailController.h"
#import "ZYLSubjectDetailModel.h"
#include "ZYLSubjectDetailCell.h"
#import "ZYLTypeCell.h"
#import "ZYLBabyShopController.h"

@interface ZYLSubjectDetailController ()

@end

@implementation ZYLSubjectDetailController
{
    NSString *freshResult;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self downloadData];
   
}





-(void)downloadData{
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:_subjecturl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        freshResult = dict[@"freshResult"];
       
        NSArray *array = dict[@"itemList"];
        NSMutableArray *left = [NSMutableArray array];
        NSMutableArray *right = [NSMutableArray array];
        
        self.DataArray = @[left,right];
        
        int i = 0;
        for (NSDictionary *itemDict in array) {
//            [ZJModelTool createModelWithDictionary:itemDict modelName:@"name"];
            ZYLSubjectDetailModel *model = [ZYLSubjectDetailModel subjectDetailModelWithDict:itemDict];
            
            CGFloat h = model.picHeight.floatValue * ScreenWidth/2.0 /model.picWidth.floatValue ;
            model.cellHeight = h  + 30;

            
            [self.DataArray[i%2] addObject:model];
           
            
            i++;
            
            
        }
        [self.tableViewleft reloadData];
        [self.tableViewright reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLSubjectDetailModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    ZYLBabyShopController *shop = [[ZYLBabyShopController alloc] init];
    shop.itemIdstr = model.itemId;
    shop.sessionDatastr = model.sessionData;
    shop.title = @"宝贝详情";
    [self.navigationController pushViewController:shop animated:YES];
    
}

#pragma mark ------------------数据刷新--------------------
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
//    //偏移量
//    if (scrollView.contentOffset.y < -20)
//    {
//        [self downloadData];
//    }
    
    //下拉刷新
    if (scrollView.frame.size.height+scrollView.contentOffset.y > scrollView.contentSize.height +50)
    {
        [self addData];//调用加载方法
    }
    
}

-(void)addData{
    
    
    NSMutableArray *DataAr = [NSMutableArray arrayWithArray:self.DataArray];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    static int start = 10;
    
    if (freshResult) {
        start = 10;
        freshResult = nil;
//        self.DataArray = nil;
    }
    
    NSString *url = [NSString stringWithFormat:@"%@&start=%d",_subjecturl,start];
    start += 10;

    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
         NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dict[@"itemList"];
        NSMutableArray *left = [NSMutableArray array];
        NSMutableArray *right = [NSMutableArray array];
        
        self.DataArray = @[left,right];
        
        int i = 0;
        for (NSDictionary *itemDict in array) {
            //            [ZJModelTool createModelWithDictionary:itemDict modelName:@"name"];
            ZYLSubjectDetailModel *model = [ZYLSubjectDetailModel subjectDetailModelWithDict:itemDict];
            
            CGFloat h = model.picHeight.floatValue * ScreenWidth/2.0 /model.picWidth.floatValue ;
            model.cellHeight = h  + 30;
            
            
            [self.DataArray[i%2] addObject:model];
            
            
            i++;
            
            
        }
        [DataAr[0] addObjectsFromArray:self.DataArray[0]];
        [DataAr[1] addObjectsFromArray:self.DataArray[1]];
        self.DataArray = DataAr;
        
        [self.tableViewleft reloadData];
        [self.tableViewright reloadData];
    
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
        
    
}







@end
