//
//  ZYLTypeController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/30.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLTypeController.h"
#import "ZYLTypeCell.h"
#import "ZYLTypeModel.h"
#import "ZYLBabyShopController.h"

@interface ZYLTypeController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableViewleft;
@property (nonatomic, strong) UITableView *tableViewright;
// 存放所有的tableView
@property (nonatomic, retain) NSArray *allTables;

@property (nonatomic, copy) NSString *refesh;


@end

@implementation ZYLTypeController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
    
    [self downloadData];
    
    [self createNavbutton];
}



-(void)createNavbutton{
    
    
    UIBarButtonItem *leftbtn = [ZYLCreateNavButton createNavButtonbackImage:@"menuLeftCellBg" image:@"left" title:nil target:self action:@selector(backPage)];
    
    self.navigationItem.leftBarButtonItem = leftbtn;
    
    UIBarButtonItem *rightbtn = [ZYLCreateNavButton createNavButtonbackImage:@"menuLeftCellBg" image:@"refresh" title:nil target:self action:@selector(refeshdata)];
    
    self.navigationItem.rightBarButtonItem = rightbtn;
}
-(void)backPage{
    [self.navigationController popViewControllerAnimated:YES];
    
}




//刷新数据
-(void)refeshdata{
    
        [self downloadData];
    [_tableViewleft setContentOffset:CGPointMake(0, 0) animated:NO];
    
}

-(void)downloadData{
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:_typeurl parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        _refesh = dict[@"freshResult"];
        NSArray *array = dict[@"itemList"];
        NSMutableArray *left = [NSMutableArray array];
        NSMutableArray *right = [NSMutableArray array];
        
        self.DataArray = @[left,right];
        
        int i = 0;
        for (NSDictionary *itemDict in array) {
//           [ZJModelTool createModelWithDictionary:cateDict modelName:@"name"];
            ZYLTypeModel *model = [ZYLTypeModel typeModelWithDict:itemDict];
            
            [self.DataArray[i%2] addObject:model];
            
            CGFloat h = model.picHeight.floatValue * ScreenWidth/2.0 /model.picWidth.floatValue ;
            model.cellHeight = h  + 30;
            
            i++;
           
            
        }
        
        [_tableViewleft reloadData];
        [_tableViewright reloadData];
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];

    
}

-(void)createUI{
    
    CGFloat w = ScreenWidth/2.0;
    CGFloat h = ScreenHight-64;
    CGFloat x = 0;
    CGFloat y = 0;
    
    _tableViewleft = [[UITableView alloc] initWithFrame:CGRectMake(x,y,w,h) style:UITableViewStylePlain];
    [self.view addSubview:_tableViewleft];
    
    _tableViewleft.delegate = self;
    _tableViewleft.dataSource = self;
    _tableViewleft.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableViewleft.showsVerticalScrollIndicator = NO;
//    _tableViewleft.bounces = NO;
    _tableViewleft.tag = 10;
    
    _tableViewright = [[UITableView alloc] initWithFrame:CGRectMake(w,y,w,h) style:UITableViewStylePlain];
    [self.view addSubview:_tableViewright];
    _tableViewright.delegate = self;
    _tableViewright.dataSource = self;
    _tableViewright.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableViewright.showsVerticalScrollIndicator = NO;;
//    _tableViewright.bounces = NO;
    _tableViewright.tag = 11;
    
    _allTables = @[_tableViewleft,_tableViewright];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.DataArray[tableView.tag - 10] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYLTypeCell *cell = [ZYLTypeCell typeCellWithTableView:tableView];
    
    cell.model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZYLTypeModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    return model.cellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ZYLBabyShopController *babyshop = [[ZYLBabyShopController alloc] init];
    
    ZYLTypeModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    babyshop.itemIdstr = model.itemId;
    babyshop.sessionDatastr = model.sessionData;
    babyshop.title = @"宝贝详情";
    
    [self.navigationController pushViewController:babyshop animated:YES];
}

#pragma mark ---------- 联动
// scrollView滑动会不停调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    //    UITableView *t = (UITableView *)scrollView;
    
    // 还是要区分是哪个tableView动了
    for (UITableView *tableView in self.allTables) {
        if (tableView == scrollView) {
            // 当前响应滚动的tableView
            continue;
        }
        // 设置剩下的两个tableView的contentOffset 与当前滚动的一致
        [tableView setContentOffset:scrollView.contentOffset];
    }
}

#pragma mark ------------------数据刷新--------------------
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    
    
    //下拉刷新
    if ( scrollView.frame.size.height+scrollView.contentOffset.y > scrollView.contentSize.height +50)
    {
        [self addData];//调用加载方法
    }
    
}

-(void)addData{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    static int start = 10;
    
    if (_refesh) {
        start = 10;
    }
    
    _refesh = nil;
    
    
    NSString *url = [NSString stringWithFormat:@"%@&start=%d",_typeurl,start];
    start += 10;
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        NSArray *array = dict[@"itemList"];
        NSMutableArray *left = [NSMutableArray array];
        NSMutableArray *right = [NSMutableArray array];
        
        NSArray *addArray = @[left,right];
        
        int i = 0;
        for (NSDictionary *itemDict in array) {
            ZYLTypeModel *model = [ZYLTypeModel typeModelWithDict:itemDict];
            
            
            
            [addArray[i%2] addObject:model];
            
            CGFloat h = model.picHeight.floatValue * ScreenWidth/2.0 /model.picWidth.floatValue ;
            model.cellHeight = h  + 30;
            
            i++;
            
            
        }
        [self.DataArray[0] addObjectsFromArray:left];
        [self.DataArray[1] addObjectsFromArray:right];
        
        [_tableViewleft reloadData];
        [_tableViewright reloadData];

        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
    
    
    
}



@end
