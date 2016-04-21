//
//  ZYLSnsLowController.m
//  DailyNew
//
//  Created by qianfeng on 15/11/1.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSnsLowController.h"
#import "ZYLSnsLowModel.h"
#import "ZYLSnsLowCell.h"

@interface ZYLSnsLowController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZYLSnsLowController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadData];
}

-(void)downloadData{
    
    NSMutableArray *arraydata = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manager GET:_snsLowUrl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dict[@"listInfo"];
        
        for (NSDictionary *commListDict in array) {
            
            [ZJModelTool createModelWithDictionary:commListDict modelName:nil];
            
            ZYLSnsLowModel *model = [ZYLSnsLowModel snsLowWithDict:commListDict];
            [arraydata addObject:model];
        }
        
        self.DataArray = arraydata;
        
        [self.TableView reloadData];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLSnsLowCell *cell = [ZYLSnsLowCell snsLowCellWithTableView:tableView];
    
    cell.model = self.DataArray[indexPath.row];
    
    return cell;
}

@end
