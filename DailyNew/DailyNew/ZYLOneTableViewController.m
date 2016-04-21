
//
//  ZYLOneTableViewController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLOneTableViewController.h"

#import "Header.h"

@interface ZYLOneTableViewController ()<UITableViewDataSource,UITableViewDelegate>


@end

@implementation ZYLOneTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUIPage];
    [self createNavbutton];
    
//    [self downloadData];
    
   
}

-(void)createNavbutton{
    
    
    UIBarButtonItem *rightbtn = [ZYLCreateNavButton createNavButtonbackImage:@"menuLeftCellBg" image:@"refresh" title:nil target:self action:@selector(refeshdata)];
    
    self.navigationItem.rightBarButtonItem = rightbtn;
}

//刷新数据
-(void)refeshdata{
    
//    [self downloadData];
    [_TableView setContentOffset:CGPointMake(0, 0) animated:NO];

}

//下载数据
-(void)downloadData{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:self.urlPage parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        self.DataDict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        [self.TableView reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

//创建UI界面
-(void)createUIPage{
    
    self.TableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height -64) style:UITableViewStylePlain];
    
    self.TableView.delegate = self;
    self.TableView.dataSource = self;

    [self.view addSubview:self.TableView];
    
    self.TableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.DataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return nil;
}

@end
