//
//  ZYLSnsController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/27.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLSnsController.h"
#import "ZYLSnsHeard.h"
#import "ZYLCellHeardModel.h"
#import "ZYLSnsModel.h"
#import "ZYLSnsCell.h"
#import "ZYLSnsRowsController.h"

@interface ZYLSnsController ()//<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) NSArray *HeardArray;

@end

@implementation ZYLSnsController
{
    NSString *_nextPage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    

//    [self setHeard];
//    
//    [self downloadData];
    [self changetoWeb];
    self.navigationController.navigationBar.hidden = YES;

}

-(void)changetoWeb{
    
    UIWebView *myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];//rect是你设计好大小的矩形
    NSURL *url = [NSURL URLWithString:@"http://bbs.j.cn/?jcnsource=android&jcnappid=866796029634199&jcnuserid=791491a7c6db4c7aa8cdfc8de6d585ce&jcnsource=android&jcnappid=866796029634199&jcnuserid=791491a7c6db4c7aa8cdfc8de6d585ce&&rootnav=no#/groups"];
    //@"https://www.baidu.com/"
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [myWebView loadRequest:request];
    myWebView.backgroundColor = [UIColor redColor];
    [self.view addSubview:myWebView];
    
}
//
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    
////    [self downloadData];
//}
//
//-(void)setHeard{
//    self.navigationController.navigationBar.hidden = YES;
//
//    
//    ZYLSnsHeard *heard = [ZYLSnsHeard snsHeardWithView];
//    [self.view addSubview:heard];
//    self.TableView.frame = CGRectMake(0, heard.bounds.size.height, self.view.bounds.size.width, self.view.bounds.size.height - heard.bounds.size.height);
//    self.TableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"MenuLeftCellSelect"]];
//    self.TableView = [self.TableView initWithFrame:self.TableView.bounds style:UITableViewStyleGrouped];
//    self.TableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//   
//    
//}
//
////下拉
//-(void)addData{
//    NSMutableArray *DataAr = [NSMutableArray arrayWithArray:self.DataArray];
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    NSString *url = [NSString stringWithFormat:@"%@&pageRecord=%@",self.urlPage,_nextPage];
//    
//    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//      
//        NSDictionary *recomDict = dict[@"recommend"];
//        
//        _nextPage = recomDict[@"nextPageRecord"];
//        
//    NSArray *RowsArray = recomDict[@"rows"];
//    
//        
//        for (NSDictionary *rowsDict in RowsArray) {
//            //            [ZJModelTool createModelWithDictionary:rowsDict modelName:@""];
//            
//            ZYLSnsModel *model = [ZYLSnsModel snsWithDict:rowsDict];
//             model.ids = rowsDict[@"id"];
//            
//            [DataAr addObject:model];
//        }
//        
//        self.DataArray = DataAr;
//        [self.TableView reloadData];
//        
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//    }];
//
//    
//    
//}
//
//
//
//
//
////下载数据
//-(void)downloadData{
//    NSMutableArray *ar = [NSMutableArray array];
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    [manager GET:self.urlPage parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//        NSArray *f = dict[@"visited"];
//        
//        for (NSDictionary *i in f) {
////            [ZJModelTool createModelWithDictionary:i modelName:@""];
//            ZYLCellHeardModel *model = [ZYLCellHeardModel cellHeardWithDict:i];
//            
//            [ar addObject:model];
//        }
//        
//        _HeardArray = ar;
//        self.TableView.tableHeaderView = [self CellHeard];
//        
//        NSDictionary *recomDict = dict[@"recommend"];
//        
//        _nextPage = recomDict[@"nextPageRecord"];
//        
//        NSArray *RowsArray = recomDict[@"rows"];
//        
//        NSMutableArray *cell = [NSMutableArray array];
//        
//        for (NSDictionary *rowsDict in RowsArray) {
////            [ZJModelTool createModelWithDictionary:rowsDict modelName:@""];
//            
//            ZYLSnsModel *model = [ZYLSnsModel snsWithDict:rowsDict];
//            model.ids = rowsDict[@"id"];
//            
//            [cell addObject:model];
//        }
//        
//        self.DataArray = cell;
//        [self.TableView reloadData];
//        
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"%@",error);
//    }];
//}
//
//
//
//-(UIView *)CellHeard{
//    UIView *heardView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 240)];
//    
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, ViewWidth, 30)];
//    [heardView addSubview:lable];
//    lable.text = @"我关注的 常去的";
//    lable.font = [UIFont systemFontOfSize:15];
//    lable.textColor = [UIColor grayColor];
//    for (int i = 0; i < _HeardArray.count; i++) {
//        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(i%2*185 + 7, i /2 * 50 + 40, 175, 40)];
//        [heardView addSubview:btn];
//        ZYLCellHeardModel *model = _HeardArray[i];
//        [btn setTitle:model.title forState:UIControlStateNormal];
//        
//        btn.adjustsImageWhenHighlighted = NO;
//        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        
//        btn.backgroundColor = [UIColor whiteColor];
//        
//        //文字左对齐
//        btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
//        //距离边框的距离
//        btn.contentEdgeInsets = UIEdgeInsetsMake(0,10, 0, 0);
//    }
//    
//    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//    
//    [heardView addSubview:button];
//    
//    [button setTitle:@"发现更多感兴趣的圈子" forState:UIControlStateNormal];
//    [button setTintColor:[UIColor whiteColor]];
//    button.layer.cornerRadius = 5;
//    button.frame = CGRectMake(85, 195, 200, 35);
//    button.backgroundColor = [UIColor redColor];
//    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
//    
//    return heardView;
//}
//
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.DataArray.count;
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    return 30;
//}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 60;
//}
//
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(15, 0, ViewWidth, 20)];
//    [view addSubview:lable];
//    lable.text = @"推荐";
//    lable.font = [UIFont systemFontOfSize:15];
//    lable.textColor = [UIColor grayColor];
//    
//    return view;
//}
//
//-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    ZYLSnsCell *cell = [ZYLSnsCell snsCellWithView];
//    
//    cell.model = self.DataArray[indexPath.row];
//    
//    
//    
//    return cell;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//    ZYLSnsRowsController *rows = [[ZYLSnsRowsController alloc] init];
//    ZYLSnsModel *model = self.DataArray[indexPath.row];
//    rows.group_id =  model.ids;
//    rows.sessData = model.sessionData;
//    
//    [self.navigationController pushViewController:rows animated:YES];
//    
//}
//
//#pragma mark ------------------数据刷新--------------------
//-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
//    
//    //偏移量
//    if (scrollView.contentOffset.y < -20)
//    {
//        [self downloadData];
//    }
//    
//    //下拉刷新
//    if (self.TableView && scrollView.frame.size.height+scrollView.contentOffset.y > scrollView.contentSize.height +50)
//    {
//        [self addData];//调用加载方法
//    }
//
//}

//- (void)setupRefresh
//
//{
//    
////    [self.TableView addFooterWithTarget:self action:@selector(footerRereshing)];
//    
//    self.TableView.footerPullToRefreshText = @"上拉可以加载更多数据了";
//    
//    self.TableView.footerReleaseToRefreshText = @"松开马上加载更多数据了";
//    
//    self.TableView.footerRefreshingText = @"MJ哥正在帮你加载中,不客气";
//    
//}

@end
