//
//  ZYLMyController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/22.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLMyController.h"
#import "ZYLMyMenuCell.h"
#import "ZYLMyMenuModel.h"
#import "ZYLMyHearView.h"
#import "ZYLFirstCell.h"
#import "ZYLWEBController.h"

@interface ZYLMyController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZYLMyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadData];
    
//    [self createUIherad];
    
}

-(void)createUIherad{
    ZYLMyHearView * Viewss = [ZYLMyHearView myHearView];
    self.TableView.tableHeaderView = Viewss;
    
    
}

//下载数据
-(void)downloadData{
    NSMutableArray *ar = [NSMutableArray array];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:self.urlPage parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *f = dict[@"myMenuList"];
        
        for (NSDictionary *i in f) {
//                        [ZJModelTool createModelWithDictionary:i modelName:@"name"];
            
            ZYLMyMenuModel *model = [ZYLMyMenuModel myMenuWithDict:i];
            
            
            [ar addObject:model];
            
            
            
            
        }
        self.DataArray = ar;
        [self.TableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark -------------------------tableview协议------------------------------

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.DataArray.count ;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.section == 0) {
//        ZYLFirstCell *cell = [ZYLFirstCell firstCellView];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
//    }
    ZYLMyMenuCell *cell = [ZYLMyMenuCell myMunuCellWithTableView:tableView];
    
    cell.Model = self.DataArray[indexPath.section];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    if (indexPath.section == 0) {
//        return 100;
//    }
    return 44;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section == 0){
//        return;
//    }
    
    ZYLMyMenuModel *model = self.DataArray[indexPath.section];
    ZYLWEBController *web = [[ZYLWEBController alloc] init];
    
    web.title = model.title;
    
    web.url = model.url;
    [self.navigationController pushViewController:web animated:YES];
    
    
}

@end
