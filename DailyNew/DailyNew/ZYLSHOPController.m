//
//  ZYLSHOPController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/29.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSHOPController.h"
#import "ZYLSHOPHeader.h"
#import "ZYLShopCell.h"
#import "ZYLShopCellModel.h"
#import "ZYLBabyShopController.h"


@interface ZYLSHOPController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation ZYLSHOPController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSString *url = [NSString stringWithFormat:@"%@&sortType=CTimeDesc",_shopurl];
    [self downloadData:url];
    
    [self setheader];
    
    [self createNavv];
}

-(void)createNavv{
    
    UIBarButtonItem *leftbtn = [ZYLCreateNavButton createNavButtonbackImage:@"menuLeftCellBg" image:@"left" title:nil target:self action:@selector(backPage)];
    
    self.navigationItem.leftBarButtonItem = leftbtn;
    
}
-(void)backPage{
    [self.navigationController popViewControllerAnimated:YES];
    
}


//设置头部
-(void)setheader{
    
    
    ZYLSHOPHeader *header = [ZYLSHOPHeader shopHeader];
    
    header.shopname = _shopname;
    
    header.block = ^(NSString *url){
        [self downloadData:url];
    };
    header.shopurl = _shopurl;
    
    self.TableView.tableHeaderView = header;
    
    self.TableView.showsVerticalScrollIndicator = NO;
    
}

//下载数据
-(void)downloadData:(NSString *)url{
    
    
    NSMutableArray *ArrayData = [NSMutableArray array];
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
  
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *itemArray = dict[@"itemList"];
        for (NSDictionary *itemDict in itemArray) {
//            [ZJModelTool createModelWithDictionary:itemDict modelName:@"name"];
            ZYLShopCellModel *model = [ZYLShopCellModel shopCellModelWithDict:itemDict];
            
            [ArrayData addObject:model];
            
        }
        
        
        
        
        self.DataArray = ArrayData;
        [self.TableView reloadData];
        
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
}






-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.DataArray.count % 2 ? self.DataArray.count / 2 + 1 : self.DataArray.count / 2;;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ZYLShopCell *cell = [ZYLShopCell shopCellWithTableView:tableView];
    
    //一次给2个数据
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSInteger index = indexPath.row * 2;
    
    for (NSInteger i = index; i < MIN(index + 2, self.DataArray.count); i++) {
        
        ZYLShopCellModel *model = self.DataArray[i];
        
        [dataArray addObject:model];
    }
    
    cell.modelArray = dataArray;
    
    cell.ChangePage = ^(NSString *seessData, NSString *itemID){
        ZYLBabyShopController *shopController = [[ZYLBabyShopController alloc] init];
        
        shopController.sessionDatastr = seessData;
        shopController.itemIdstr = itemID;
        
        [self.navigationController pushViewController:shopController animated:YES];
    };
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 200;
}


@end
