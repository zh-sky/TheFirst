//
//  ZYLHotPersonController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLHotPersonController.h"
#import "ZYLHotPersonModel.h"
#import "ZYLHotPersonCell.h"
#import "ZYLPhohoController.h"

@interface ZYLHotPersonController ()

@end

@implementation ZYLHotPersonController
{
    NSString *freshRecord;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadData];
}

//下载数据
-(void)downloadData{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:_HotUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        freshRecord = dict[@"freshRecord"];
        NSArray *itemArray = dict[@"itemList"];
        
        NSMutableArray *left = [NSMutableArray array];
        NSMutableArray *right = [NSMutableArray array];
        
        self.DataArray = @[left,right];
        int i = 0;
        for (NSDictionary *itemDict in itemArray) {
//            [ZJModelTool createModelWithDictionary:itemDict modelName:@"name"];
            ZYLHotPersonModel *Model = [ZYLHotPersonModel hotPersonModelWithDict:itemDict];
            
            CGFloat h = Model.picHeight.floatValue * ScreenWidth/2.0 /Model.picWidth.floatValue ;
            Model.cellHeight = h  + 30;
            Model.ids = itemDict[@"id"];
            
            
            [self.DataArray[i%2] addObject:Model];
            
            
            i++;
        }
        [self.tableViewleft reloadData];
        [self.tableViewright reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYLHotPersonCell *cell = [ZYLHotPersonCell hotPersonCellWithTableView:tableView];
    cell.personModel = self.DataArray[tableView.tag - 10][indexPath.row];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
        
        ZYLHotPersonModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
        
        return model.cellHeight;
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLHotPersonModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    ZYLPhohoController *phone = [[ZYLPhohoController alloc] init];
    
    phone.phohourl = [NSString stringWithFormat:@"%@&dreId=%@",Try_phoho,model.ids];
    
    [self.navigationController pushViewController:phone animated:YES];
    
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
    
    NSString *url = [NSString stringWithFormat:@"%@&freshRecord=%@",_HotUrl,freshRecord];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        freshRecord = dict[@"freshRecord"];
        NSArray *array = dict[@"itemList"];
        NSMutableArray *left = [NSMutableArray array];
        NSMutableArray *right = [NSMutableArray array];
        
        self.DataArray = @[left,right];
        
        int i = 0;
        for (NSDictionary *itemDict in array) {
            //            [ZJModelTool createModelWithDictionary:itemDict modelName:@"name"];
            ZYLHotPersonModel *Model = [ZYLHotPersonModel hotPersonModelWithDict:itemDict];
            
            CGFloat h = Model.picHeight.floatValue * ScreenWidth/2.0 /Model.picWidth.floatValue ;
            Model.cellHeight = h  + 30;
            Model.ids = itemDict[@"id"];
            
            
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
