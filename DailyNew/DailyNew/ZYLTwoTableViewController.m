//
//  ZYLTwoTableViewController.m
//  DailyNew
//
//  Created by qianfeng on 15/10/20.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ZYLTwoTableViewController.h"
#import "ZYLTypeCell.h"
#import "ZYLSubjectDetailCell.h"
#import "ZYLTrysCell.h"


@interface ZYLTwoTableViewController ()<UITableViewDataSource,UITableViewDelegate>



@end

@implementation ZYLTwoTableViewController


-(void)viewDidLoad{
    [super viewDidLoad];
    
    [self createNavbutton];
    
    [self createUI];
    
}

-(void)createUI{
    _tableViewleft = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth/2.0, ViewHight-64-49) style:UITableViewStylePlain];
    [self.view addSubview:_tableViewleft];
    _tableViewleft.tag = 10;
    _tableViewleft.showsVerticalScrollIndicator = NO;
    _tableViewleft.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _tableViewright = [[UITableView alloc] initWithFrame:CGRectMake(ScreenWidth/2.0, 0, ScreenWidth/2.0, ViewHight-64-49) style:UITableViewStylePlain];
    [self.view addSubview:_tableViewright];
     _tableViewright.tag = 11;
    _tableViewright.showsVerticalScrollIndicator = NO;
    _tableViewright.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.tableViewleft.delegate = self;
    self.tableViewleft.dataSource = self;
    
    self.tableViewright.delegate = self;
    self.tableViewright.dataSource =self;

    
    _allTables = @[_tableViewleft,_tableViewright];
    
    
}



-(void)createNavbutton{
    
    
//    UIBarButtonItem *leftbtn = [ZYLCreateNavButton createNavButtonbackImage:@"menuLeftCellBg" image:@"left" title:nil target:self action:@selector(backPage)];
//    
//    self.navigationItem.leftBarButtonItem = leftbtn;
    
    UIBarButtonItem *rightbtn = [ZYLCreateNavButton createNavButtonbackImage:@"menuLeftCellBg" image:@"refresh" title:nil target:self action:@selector(refeshdata)];
    
    self.navigationItem.rightBarButtonItem = rightbtn;
}
//-(void)backPage{
//    [self.navigationController popViewControllerAnimated:YES];
//    
//}




//刷新数据
-(void)refeshdata{
    
//    [self downloadData];
    [_tableViewleft setContentOffset:CGPointMake(0, 0) animated:NO];
    
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.DataArray[tableView.tag - 10] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.title isEqualToString:@"主题活动"]) {
        ZYLSubjectDetailCell *cell = [ZYLSubjectDetailCell subjectCellWithTableView:tableView];
        
        cell.model = self.DataArray[tableView.tag - 10][indexPath.row];
        
        return cell;
    }
    if ([self.title isEqualToString:@"试衣"]) {
        
        ZYLTrysCell *cell = [ZYLTrysCell trysCellWithTableView:tableView];
        cell.model = self.DataArray[tableView.tag - 10][indexPath.row];
        
        return cell;

        
    }
    ZYLTypeCell *cell = [ZYLTypeCell typeCellWithTableView:tableView];
    
    cell.model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.title isEqualToString:@"主题活动"]){
    ZYLSubjectDetailModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    return model.cellHeight;
    }
    if ([self.title isEqualToString:@"试衣"]){
        
        ZYLTrysModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
        
        return model.cellHeight;
        
    }
    ZYLTypeModel *model = self.DataArray[tableView.tag - 10][indexPath.row];
    
    return model.cellHeight;
    
}

@end
