//
//  ZYLTryController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLTryController.h"
#import "ZYLTrysModel.h"
#import "ZYLTrysCell.h"
#import "ZYLHotPersonController.h"
#import "ZYLSchemaController.h"
#import "ZYLWEBController.h"

@interface ZYLTryController ()

@end

@implementation ZYLTryController
{
    NSString *freshRecord;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self downloadData];
    self.view.backgroundColor = [UIColor blackColor];
    
}



//下载数据
-(void)downloadData{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:self.urlPage parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        freshRecord = dict[@"freshRecord"];
        NSArray *munuArray = dict[@"myMenuList"];
        
        NSMutableArray *left = [NSMutableArray array];
        NSMutableArray *right = [NSMutableArray array];
        
        self.DataArray = @[left,right];
        int i = 0;
        for (NSDictionary *munuDict in munuArray) {
            ZYLTrysModel *Model = [ZYLTrysModel trysWithDict:munuDict];
             
            Model.cellHeight = 200 + 30;
            
            
            [self.DataArray[i%2] addObject:Model];
            
            
            i++;
        }
        [self.tableViewleft reloadData];
        [self.tableViewright reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLTrysModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    if ([model.openType isEqualToString:@"App"]) {
        ZYLHotPersonController *hotPerson = [[ZYLHotPersonController alloc] init];
        
        hotPerson.HotUrl = [NSString stringWithFormat:@"%@&menuId=%@",Try_FAN,model.itemId];
        hotPerson.title = model.title;
        
        
        [self.navigationController pushViewController:hotPerson animated:YES];
    }
    if ([model.openType isEqualToString:@"Schema"]) {
        ZYLSchemaController *schema = [[ZYLSchemaController alloc] init];
        
        schema.Schemaurl = [NSString stringWithFormat:@"%@&parentId=%@",Try_Schema,model.itemId];
        schema.title = model.title;
        
        
        [self.navigationController pushViewController:schema animated:YES];
    }
    if ([model.openType isEqualToString:@"Webview"]) {
        ZYLWEBController *web = [[ZYLWEBController alloc] init];
        
        web.url = model.url;
        web.title = model.title;
        
        [self.navigationController pushViewController:web animated:YES];
    }
    
    
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
    
    
    if ([freshRecord isEqualToString:@""]) {
        return;
    }
    
    NSString *url = [NSString stringWithFormat:@"%@&freshRecord=%@",self.urlPage,freshRecord];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        freshRecord = dict[@"freshRecord"];
        NSArray *array = dict[@"myMenuList"];
        NSMutableArray *left = [NSMutableArray array];
        NSMutableArray *right = [NSMutableArray array];
        
        self.DataArray = @[left,right];
        
        int i = 0;
        for (NSDictionary *munuDict in array) {
            //            [ZJModelTool createModelWithDictionary:itemDict modelName:@"name"];
            ZYLTrysModel *Model = [ZYLTrysModel trysWithDict:munuDict];
            
            Model.cellHeight = 200 + 30;
            
            
            [self.DataArray[i%2] addObject:Model];
            
            
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
