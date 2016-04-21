//
//  ZYLSearchController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/26.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSearchController.h"
#import "ZYLSearchMenuCell.h"
#import "ZYLSearchShopCell.h"
#import "ZYLSearchHeardView.h"
#import "ZYLTypeController.h"
#import "ZYLSubjectDetailController.h"

@interface ZYLSearchController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableViewMenu;
@property (nonatomic, strong) UITableView *tableViewShop;
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) NSArray *DataArray;

@property (nonatomic, strong) NSArray *titleArray;

@end

@implementation ZYLSearchController
{
    UIButton *lastBtn;
    NSArray *termID;
    NSInteger row;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createUI];
    NSString *url = [NSString stringWithFormat:@"%@&termId=0",Search_PAGE];
    [self downloadData:url];
    
    // Do any additional setup after loading the view.
}



-(void)createUI{
    
    termID = @[@"&termId=0",@"&termId=6",@"&termId=5",@"&termId=3",@"&termId=81",@"&termId=141",@"&termId=296",@"&termId=-1",@"&termId=-2"];
    
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 44)];
    [self.view addSubview:_searchBar];
    
    _searchBar.placeholder = @"搜索您喜欢的宝贝";
    _searchBar.delegate = self;
    
    _tableViewMenu = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, 100, self.view.bounds.size.height - _searchBar.bounds.size.height -64-44) style:UITableViewStylePlain];
    [self.view addSubview:_tableViewMenu];
    
    _tableViewMenu.delegate = self;
    _tableViewMenu.dataSource = self;
    //    _tableViewMenu.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableViewMenu.showsVerticalScrollIndicator = NO;
    _tableViewMenu.bounces = NO;
    _tableViewMenu.tableHeaderView.hidden = YES;
    
    _tableViewShop = [[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_tableViewMenu.frame), 44, self.view.bounds.size.width - CGRectGetMaxX(_tableViewMenu.frame), self.view.bounds.size.height - _searchBar.bounds.size.height-100) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableViewShop];
    _tableViewShop.delegate = self;
    _tableViewShop.dataSource = self;
    _tableViewShop.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableViewShop.showsVerticalScrollIndicator = NO;
    _tableViewShop.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MenuLeftCellSelect"]];
    _tableViewShop.bounces = NO;
    
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_searchBar resignFirstResponder];
    _searchBar.text = nil;
}

//搜索栏
-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:YES animated:YES];
    return YES;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    NSString *search = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)_searchBar.text, NULL, NULL, kCFStringEncodingUTF8);
    NSString * url = [NSString stringWithFormat:@"%@&keyWord=%@",Search_lan,search];
    
    ZYLSubjectDetailController *subject = [[ZYLSubjectDetailController alloc] init];
    
    subject.subjecturl = url;
    subject.title = _searchBar.text;
    
    [self.navigationController pushViewController:subject animated:YES];

}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (tableView == _tableViewShop) {
        
        ZYLSearchHeardView *heard = [ZYLSearchHeardView searchHeardView];
        heard.titleLable = self.titleArray[section];
        
        return heard;
    }
    return nil;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (_tableViewShop == tableView) {
        return self.DataArray.count;
    }
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (_tableViewShop == tableView) {
        if (self.DataArray.count == 1) {
            return 0;
        }
        return 44;
    }
    
    return 0;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == _tableViewMenu) {
        return 9;
        
    }
    NSArray *firstArray = self.DataArray[section];
    
    return firstArray.count % 3 ? firstArray.count / 3 + 1 : firstArray.count / 3;
}


-(void)downloadData:(NSString *)url{
    
    NSMutableArray *arraydata = [NSMutableArray array];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *array = dict[@"categrayInfos"];
        NSMutableArray *titleA = [NSMutableArray array];
        
        for (NSDictionary *cateDict in array) {
            //            [ZJModelTool createModelWithDictionary:cateDict modelName:@"name"];
            
            [titleA addObject:cateDict[@"cateName"]];
            
            
            NSMutableArray *sencdArray = [NSMutableArray array];
            NSArray *tagInfosArray = cateDict[@"tagInfos"];
            for (NSDictionary *tagInfosDict in tagInfosArray) {
                //                [ZJModelTool createModelWithDictionary:dc modelName:@"name"];
                ZYLSearchShopModel *model = [ZYLSearchShopModel searchShopWithDict:tagInfosDict];
                
                [sencdArray addObject:model];
            }
            
            [arraydata addObject:sencdArray];
            
            
            
            
        }
        self.titleArray = titleA;
        self.DataArray = arraydata;
        
        [_tableViewShop reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tableViewShop) {
        return 100;
    }
    return 60;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (tableView == _tableViewMenu){
        ZYLSearchMenuCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            cell = [[ZYLSearchMenuCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        
        cell.rowteger = indexPath.row;
        cell.titleBtn = @[@" 热门",@" 上衣",@" 裤子",@" 裙子",@" 鞋子",@" 包包",@" 配饰",@" 搭配",@" 专题"];
        cell.imageBtn = @[@"hot",@"tops",@"pants",@"skirt",@"shoes",@"bag",@"accessories",@"dapei",@"zhuanti"];
        cell.selectImageBtn = @[@"hot-blue",@"tops-blue",@"pants-blue",@"skirt-blue",@"shoes-blue",@"bag-blue",@"accessories-blue",@"dapei-blue",@"zhuanti-blue"];
        
        
        cell.block = ^(UIButton *btn){
            
            
                NSString *url = [NSString stringWithFormat:@"%@%@",Search_PAGE,termID[btn.tag]];
                [self downloadData:url];
            
            
            [_tableViewShop setContentOffset:CGPointMake(0, 0) animated:NO];
            if ([btn isEqual:lastBtn]) {
                return ;
            }
            lastBtn.userInteractionEnabled = YES;
            lastBtn.selected = NO;
            
            lastBtn = btn;
            row = btn.tag;
            
            
        };
        return cell;
    }
    ZYLSearchShopCell *cell = [ZYLSearchShopCell searchShopWith:tableView];
    
    NSArray *firstArray = self.DataArray[indexPath.section];
    
    //一次给3个数据
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    NSInteger index = indexPath.row * 3;
    
    for (NSInteger i = index; i < MIN(index + 3, firstArray.count); i++) {
        
        ZYLSearchShopModel *model = firstArray[i];
        
        [dataArray addObject:model];
    }
    
    cell.modelArray = dataArray;
    
    cell.block = ^(NSString *title,NSString *url){
        
        if ([title isEqualToString:@"特卖会"]) {
            
            ZYLSubjectDetailController *subject = [[ZYLSubjectDetailController alloc]init];
            
            subject.title = @"主题活动";
            
            
            subject.subjecturl = [NSString stringWithFormat:@"%@&title=????",Subject_Page];
            
            [self.navigationController pushViewController:subject animated:YES];
            
            return ;
        }
        
       ZYLSubjectDetailController *subject = [[ZYLSubjectDetailController alloc]init];
        

        subject.title = title;
        subject.subjecturl = [NSString stringWithFormat:@"%@%@&pid=%@",Search_type,termID[row],url];

        [self.navigationController pushViewController:subject animated:YES];
    };
    
    return cell;
    
}



@end
