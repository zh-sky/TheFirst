//
//  ZYLSnsRowsController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/31.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSnsRowsController.h"
#import "ZYLSnsRowsModel.h"
#import "ZYLSnsRowsCell.h"
#import "ZYLSnsLowController.h"

@interface ZYLSnsRowsController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZYLSnsRowsController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self downloadData];
    self.TableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MenuLeftCellSelect"]];
    
}
-(void)downloadData{
    
    NSMutableArray *arraydata = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    NSString *url = [NSString stringWithFormat:@"%@&group_id=%@&sessionData=%@",SNS_ROWS,_group_id,_sessData];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dict[@"commList"];
        
        for (NSDictionary *commListDict in array) {
            
            ZYLSnsRowsModel *rows = [ZYLSnsRowsModel snsRowsWithDict:commListDict];
            rows.ids = commListDict[@"id"];
            [arraydata addObject:rows];
        }
        
        self.DataArray = arraydata;
        
        [self.TableView reloadData];
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYLSnsRowsCell *cell = [ZYLSnsRowsCell snsRowsCellWithView];

    cell.model = self.DataArray[indexPath.row];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYLSnsLowController *snslow = [[ZYLSnsLowController alloc] init];
    ZYLSnsRowsModel *model = self.DataArray[indexPath.row];
    NSString *url = [NSString stringWithFormat:@"%@&id=%@&sessionData=%@",Sns_ROWs_LOW,model.ids,model.sessionData];
    snslow.snsLowUrl = url;
    
    [self.navigationController pushViewController:snslow animated:YES];
    
}

@end
